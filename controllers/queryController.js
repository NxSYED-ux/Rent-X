const { Op, QueryTypes} = require("sequelize");
const sequelize = require('../config/db');
const Buildings = require("../models/Buildings");
const UserBuildingUnits = require("../models/UserBuildingUnits");
const BuildingUnits = require("../models/BuildingUnits");
const Departments = require("../models/Departments");
const StaffMembers = require("../models/StaffMembers");
const Queries = require("../models/Queries");
const QueryPictures = require("../models/QueryPictures");
const FormData = require("form-data");
const fs = require("fs");
const axios = require("axios");
const BuildingPictures = require("../models/BuildingPictures");


const userUnitNames = async (req, res) => {
    try {
        if (!req.user?.id) return res.status(400).json({ error: "User ID is required" });
        
        const userUnits = await UserBuildingUnits.findAll({
            where: { user_id: req.user.id },
            include: [{ model: BuildingUnits, as: 'unit', attributes: ['id', 'unit_name','organization_id'], required: true }]
        });
        
        const formattedUnits = userUnits.map(unit => ({
            id: unit.unit.id,
            unit_name: unit.unit.unit_name,
            organization_id: unit.unit.organization_id
        }));
        
        res.json({ units: formattedUnits});
    } catch (error) {
        console.error("Error in userUnitNames:", error);
        res.status(500).json({ error: "Internal server error" });
    }
};

const correspondingDepartments = async (req, res) => {
    try {
        const organizationId = parseInt(req.params.organizationId, 10);
        
        if (isNaN(organizationId)) {
            return res.status(400).json({ error: 'Invalid Organization ID' });
        }
        
        const departments = await Departments.findAll({
            where: { organization_id: organizationId },
            attributes: ['id', 'name']
        });
        
        res.json({ departments });
    } catch {
        console.error("Error in correspondingDepartments:", error);
        res.status(500).json({ error: "Internal server error"});
    }
};

const logQuery = async (req, res) => {
    const { departmentId, UnitId, description } = req.body;
    let pictures = req.files?.picture;
    
    if (!req.user?.id) return res.status(400).json({ error: "User ID is required" });
    if (!departmentId || !UnitId) return res.status(400).json({ error: "Department and Unit are required." });
    if (!description) return res.status(400).json({ error: "Description is required." });

    if (pictures && !Array.isArray(pictures)) {
        pictures = [pictures];
    }
    
    if (pictures) {
        for (const picture of pictures) {
            if (!picture.mimetype.startsWith('image/')) {
                return res.status(400).json({ error: 'Only image files are allowed.' });
            }
            if (picture.size > 2 * 1024 * 1024) {
                return res.status(400).json({ error: 'Each image must be less than 2MB.' });
            }
        }
    }
    
    const transaction = await sequelize.transaction();
    
    try {
        const building = await BuildingUnits.findOne({
            where: { id: UnitId },
            attributes: ['building_id'],
            transaction
        });
        
        if (!building) throw new Error("Invalid Unit.");
        
        const staffMember = await StaffMembers.findOne({
            where: { department_id: departmentId, building_id: building.building_id, status: 1, accept_queries: 1 },
            attributes: ['id', 'user_id', 'active_load'],
            order: [["active_load", "ASC"]],
            lock: transaction.LOCK.UPDATE,
            skipLocked: true,
            transaction,
        });
        
        if (!staffMember) throw new Error("No available staff member, try again later.");
        
        const query = await Queries.create({
            user_id: req.user.id,
            unit_id: UnitId,
            building_id: building.building_id,
            department_id: departmentId,
            staff_member_id: staffMember.id,
            description,
            status: "Open",
        }, { transaction });
        
        await StaffMembers.update(
            { active_load: staffMember.active_load + 1 },
            { where: { id: staffMember.id }, transaction }
        );
        
        if (pictures && pictures.length > 0) {
            const formData = new FormData();
            formData.append('Folder', 'query');
            
            for (const picture of pictures) {
                formData.append('pictures[]', fs.createReadStream(picture.tempFilePath), picture.name);
            }
            
            const response = await axios.post(`${process.env.PHP_Server_URL}/upload-images`, formData, {
                headers: { ...formData.getHeaders() },
            });
            
            if (!response.data.paths || response.data.paths.length === 0) {
                throw new Error("Failed to upload images to server.");
            }
            
            const picPaths = response.data.paths;
            const query_id = query.id;
            await Promise.all(picPaths.map((path) =>
                QueryPictures.create({
                    query_id,
                    file_path: path,
                    file_name: path
                }, { transaction })
            ));
        }
        
        await transaction.commit();
        res.status(201).json({ message: "Query logged successfully", query });
        
    } catch (error) {
        await transaction.rollback();
        console.error("Error in logQuery:", error);
        res.status(500).json({ error: error.message || "Failed to assign query, try again later." });
    }
};

const getQueriesByField = (field) => async (req, res) => {
    if (!req.user?.id) {
        return res.status(400).json({ error: "User ID is required" });
    }
    let userId;
    if(field === 'user_id') {
        userId = req.user.id;
    }
    else if (field === 'staff_member_id') {
        const staffData = await StaffMembers.findOne({
            where: { user_id: req.user.id },
        })
        if (!staffData) {
            return res.status(400).json({ queries: [] });
        }
        userId = staffData.id;
    }else{
        return res.status(400).json({ error: "Invalid field parameter" });
    }
    
    const { statuses } = req.query;
    
    if (!statuses || !statuses.trim()) {
        return res.status(400).json({ error: "Statuses are required" });
    }
    
    const statusArray = statuses.split(",");
    
    try {
        const queries = await Queries.findAll({
            where: {
                [field]: userId,
                status: { [Op.in]: statusArray }
            },
            attributes: ['id', 'description', 'status', 'expected_closure_date', 'remarks', 'created_at'],
            include: [
                {
                    model: BuildingUnits,
                    as: 'unit',
                    attributes: ['unit_name'],
                },
                {
                    model: Buildings,
                    as: 'building',
                    attributes: ['name'],
                    include: [
                        {
                            model: BuildingPictures,
                            as: 'pictures',
                            attributes: ['file_path'],
                        }
                    ]
                }
            ],
            order: [["created_at", "DESC"]],
        });
        
        res.status(200).json({ queries });
    } catch (error) {
        console.error("Error in getQueriesByField:", error);
        res.status(500).json({ error: error.message || "Failed to retrieve queries" });
    }
};

const getQueryDetails = async (req, res) => {
    try {
        const { id } = req.params;
        
        if (!id || isNaN(id)) {
            return res.status(400).json({ error: "Invalid query ID" });
        }
        
        const query = await Queries.findOne({
            where: { id },
            attributes: ["id", "user_id", "building_id", "department_id", "staff_member_id", "description", "status", "expected_closure_date", "created_at"],
            include: [
                {
                    model: QueryPictures,
                    as: 'pictures',
                    attributes: ['file_path'],
                },
                {
                    model: BuildingUnits,
                    as: 'unit',
                    attributes: ['unit_name'],
                }
            ],
        });
        
        if (!query) {
            return res.status(404).json({ error: "Query not found" });
        }
        
        res.status(200).json({ query });
    } catch (error) {
        console.error("Error in getQueryDetails:", error);
        res.status(500).json({ error: "Failed to retrieve query details" });
    }
};

const acceptOrRejectQuery = (status) => async (req, res) => {
    const queryId = req.body.id;
    const closure_date = req.body.date;
    const remarks = req.body?.remarks;
    
    if (!req.user?.id) return res.status(400).json({ error: "User ID is required" });
    
    if (!queryId) {
        return res.status(400).json({ error: "Query id is required" });
    }
    
    if (status === "Rejected" && (!remarks || remarks.trim().length === 0)) {
        return res.status(400).json({ error: "Remarks are required for rejection" });
    }
    
    try {
        const staffData = await StaffMembers.findOne({
            where: { user_id: req.user.id },
        });
        
        if (!staffData) {
            return res.status(400).json({ error: "Only Staff can access this page" });
        }
        
        const [updatedRows] = await Queries.update(
            {
                status: status === "Rejected" ? "Rejected" : "In Progress",
                remarks: status === "Rejected" ? remarks : null,
                expected_closure_date: closure_date,
            },
            { where: { id: queryId, status: 'Open', staff_member_id: staffData.id } }
        );
        
        if (updatedRows === 0) {
            return res.status(400).json({ error: "Unable to update status: The query ID may be invalid or the query status is already changed" });
        }
        
        res.status(200).json({ message: "Status changed successfully" });
    } catch (error) {
        console.error("Error in acceptOrRejectQuery:", error);
        res.status(500).json({ error: "Failed to update query status" });
    }
};

const getQueriesCount = async (req, res) => {
    try {
        if (!req.user?.id) return res.status(400).json({ error: "User ID is required" });
        
        const staffData = await StaffMembers.findOne({
            where: { user_id: req.user.id },
        });
        
        
        if (!staffData) return res.json({ success: true, data: [] });
        
        const staffMemberId = staffData?.id;
        
        const query = `
            SELECT
                COUNT(*) AS total_queries,
                SUM(CASE WHEN status = 'Open' THEN 1 ELSE 0 END) AS Open,
                SUM(CASE WHEN status = 'In Progress' THEN 1 ELSE 0 END) AS In_Progress,
                SUM(CASE WHEN status = 'Closed' THEN 1 ELSE 0 END) AS Closed,
                SUM(CASE WHEN status = 'Rejected' THEN 1 ELSE 0 END) AS Rejected
            FROM queries
            WHERE staff_member_id = :staffMemberId;
        `;
        
        const results = await sequelize.query(query, {
            replacements: { staffMemberId },
            type: QueryTypes.SELECT
        });
        
        return res.json({ success: true, data: results });
    } catch (error) {
        console.error(error);
        return res.status(500).json({ success: false, message: 'Internal Server Error' });
    }
};

const getQueriesChartData = async (req, res) => {
    try {
        if (!req.user?.id) return res.status(400).json({ error: "User ID is required" });
        
        const staffData = await StaffMembers.findOne({
            where: { user_id: req.user.id },
        });
        
        if (!staffData) return res.json({ success: true, data: [] });
        
        const staffMemberId = staffData.id;
        const selectedYear = req.params?.year;
        
        if (!selectedYear) return res.status(400).json({ error: "Year is required" });
        
        const query = `
            SELECT
                DATE_FORMAT(created_at, '%Y-%m') AS query_month,
                COUNT(*) AS total_queries,
                SUM(CASE WHEN status = 'Open' THEN 1 ELSE 0 END) AS Open,
                SUM(CASE WHEN status = 'In Progress' THEN 1 ELSE 0 END) AS In_Progress,
                SUM(CASE WHEN status = 'Closed' THEN 1 ELSE 0 END) AS Closed,
                SUM(CASE WHEN status = 'Rejected' THEN 1 ELSE 0 END) AS Rejected
            FROM queries
            WHERE staff_member_id = :staffMemberId AND YEAR(created_at) = :selectedYear
            GROUP BY query_month
            ORDER BY query_month;
        `;
        
        const results = await sequelize.query(query, {
            replacements: { staffMemberId, selectedYear },
            type: QueryTypes.SELECT
        });
        
        return res.json({ success: true, data: results });
    } catch (error) {
        console.error('Error in Queries Count: ', error.message);
        return res.status(500).json({ success: false, message: 'Internal Server Error' });
    }
};

const getQueryStats = async (req, res) => {
    // This one is complex and not recomended to use it don't need that much complexity
    try {
        if (!req.user?.id) return res.status(400).json({ error: "User ID is required" });

        const staffData = await StaffMembers.findOne({ where: { user_id: req.user.id } });
        if (!staffData) return res.json({ success: true, yearly: {}, monthly: {} });

        const staffMemberId = staffData.id;
        const year = req.query?.year;
        const month = req.query?.month;

        const statusQuery = `SELECT DISTINCT status FROM queries`;
        const statuses = await sequelize.query(statusQuery, { type: QueryTypes.SELECT });
        const statusList = statuses.map(s => s.status);

        const statusCases = statusList.map(status =>
            `SUM(CASE WHEN status = '${status}' THEN 1 ELSE 0 END) AS \`${status}\``
        ).join(', ');

        let whereClause = `WHERE staff_member_id = :staffMemberId`;
        let replacements = { staffMemberId };

        if (year) {
            whereClause += ` AND YEAR(created_at) = :year`;
            replacements.year = year;
        }

        if (month) {
            whereClause += ` AND MONTH(created_at) = :month`;
            replacements.month = month;
        }

        // Query for monthly or specific month grouping
        const monthlyQuery = `
            SELECT
                YEAR(created_at) AS query_year,
                DATE_FORMAT(created_at, '%Y-%m') AS query_month,
                COUNT(*) AS total_queries,
                ${statusCases}
            FROM queries
                ${whereClause}
            GROUP BY query_year, query_month
            ORDER BY query_year, query_month;
        `;

        // Query for yearly total
        const yearlyQuery = `
            SELECT
                YEAR(created_at) AS query_year,
                COUNT(*) AS total_queries,
                ${statusCases}
            FROM queries
                ${whereClause}
            GROUP BY query_year
            ORDER BY query_year;
        `;

        const [monthlyResults, yearlyResults] = await Promise.all([
            sequelize.query(monthlyQuery, { replacements, type: QueryTypes.SELECT }),
            sequelize.query(yearlyQuery, { replacements, type: QueryTypes.SELECT })
        ]);

        const monthNames = {
            "01": "January", "02": "February", "03": "March", "04": "April",
            "05": "May", "06": "June", "07": "July", "08": "August",
            "09": "September", "10": "October", "11": "November", "12": "December"
        };

        let formattedData = { success: true, yearly: {}, monthly: {} };

        // If yearly data exists, store it correctly per year
        yearlyResults.forEach(row => {
            formattedData.yearly[row.query_year] = {
                total_queries: row.total_queries
            };
            statusList.forEach(status => {
                formattedData.yearly[row.query_year][status] = row[status] || "0";
            });
        });

        // Properly organize monthly results by year and month
        monthlyResults.forEach(row => {
            const yearKey = row.query_year;
            const monthKey = monthNames[row.query_month.split("-")[1]];

            if (!formattedData.monthly[yearKey]) {
                formattedData.monthly[yearKey] = {};
            }

            formattedData.monthly[yearKey][monthKey] = { total_queries: row.total_queries };
            statusList.forEach(status => {
                formattedData.monthly[yearKey][monthKey][status] = row[status] || "0";
            });
        });

        return res.json(formattedData);

    } catch (error) {
        console.error('Error in getQueryStats:', error.message);
        return res.status(500).json({ success: false, message: 'Internal Server Error' });
    }
};

const getYearlyQueryStats = async (req, res) => {
    try {
        if (!req.user?.id) {
            return res.status(400).json({ error: "User ID is required" });
        }
        
        const staffData = await StaffMembers.findOne({ where: { user_id: req.user.id } });
        if (!staffData) return res.json({ yearly: {}, monthly: {} });
        
        const staffMemberId = staffData.id;
        const year = req.query?.year;
        const month = req.query?.month;
        
        const statusQuery = `SELECT DISTINCT status FROM queries`;
        const statuses = await sequelize.query(statusQuery, { type: QueryTypes.SELECT });
        const statusList = statuses.map(s => s.status);
        
        const statusCases = statusList.map(status =>
            `SUM(CASE WHEN status = '${status}' THEN 1 ELSE 0 END) AS \`${status}\``
        ).join(', ');
        
        let whereClause = `WHERE staff_member_id = :staffMemberId`;
        let replacements = { staffMemberId };
        
        if (year) {
            whereClause += ` AND YEAR(created_at) = :year`;
            replacements.year = year;
        }
        
        if (month) {
            whereClause += ` AND MONTH(created_at) = :month`;
            replacements.month = month;
        }
        
        // Query for both yearly and monthly based on input
        const query = `
            SELECT
                COUNT(*) AS total_queries,
                ${statusCases}
            FROM queries
            ${whereClause}
        `;
        
        const results = await sequelize.query(query, { replacements, type: QueryTypes.SELECT });
        
        return res.json({ success: true, data: results });
        
    } catch (error) {
        console.error('Error in getQueryStats:', error.message);
        return res.status(500).json({ success: false, message: 'Internal Server Error' });
    }
};

// const getYearlyQueryStats = async (req, res) => {
//     try {
//         if (!req.user?.id) return res.status(400).json({ error: "User ID is required" });
//
//         const staffData = await StaffMembers.findOne({ where: { user_id: req.user.id } });
//         if (!staffData) return res.json({yearly: {} });
//
//         const staffMemberId = staffData.id;
//         const year = req.query?.year;
//
//         const statusQuery = `SELECT DISTINCT status FROM queries`;
//         const statuses = await sequelize.query(statusQuery, { type: QueryTypes.SELECT });
//         const statusList = statuses.map(s => s.status);
//
//         const statusCases = statusList.map(status =>
//             `SUM(CASE WHEN status = '${status}' THEN 1 ELSE 0 END) AS \`${status}\``
//         ).join(', ');
//
//         let whereClause = `WHERE staff_member_id = :staffMemberId`;
//         let replacements = { staffMemberId };
//
//         if (year) {
//             whereClause += ` AND YEAR(created_at) = :year`;
//             replacements.year = year;
//         }
//
//         const yearlyQuery = `
//             SELECT COUNT(*) AS total_queries, ${statusCases}
//             FROM queries
//             ${whereClause};
//         `;
//
//         const [yearlyResults] = await sequelize.query(yearlyQuery, { replacements, type: QueryTypes.SELECT });
//
//         return res.json({yearly: yearlyResults[0] || {} });
//
//     } catch (error) {
//         console.error('Error in getYearlyQueryStats' , error.message);
//         return res.status(500).json({ success: false, message: 'Internal Server Error' });
//     }
// };

const getMonthlyQueryStats = async (req, res) => {
    try {
        if (!req.user?.id) return res.status(400).json({ error: "User ID is required" });
        
        const staffData = await StaffMembers.findOne({ where: { user_id: req.user.id } });
        if (!staffData) return res.json({ monthly: {} });
        
        const staffMemberId = staffData.id;
        const year = req.query?.year;
        const month = req.query?.month;
        
        if (!year) return res.status(400).json({ error: "Year is required for monthly stats" });
        
        const statusQuery = `SELECT DISTINCT status FROM queries`;
        const statuses = await sequelize.query(statusQuery, { type: QueryTypes.SELECT });
        const statusList = statuses.map(s => s.status);
        
        const statusCases = statusList.map(status =>
            `SUM(CASE WHEN status = '${status}' THEN 1 ELSE 0 END) AS \`${status}\``
        ).join(', ');
        
        let whereClause = `WHERE staff_member_id = :staffMemberId AND YEAR(created_at) = :year`;
        let replacements = { staffMemberId, year };
        
        if (month) {
            whereClause += ` AND MONTH(created_at) = :month`;
            replacements.month = month;
        }
        
        const monthlyQuery = `
            SELECT DATE_FORMAT(created_at, '%Y-%m') AS query_month, COUNT(*) AS total_queries, ${statusCases}
            FROM queries
            ${whereClause}
            GROUP BY query_month
            ORDER BY query_month;
        `;
        
        const monthlyResults = await sequelize.query(monthlyQuery, { replacements, type: QueryTypes.SELECT });
        
        const monthNames = {
            "01": "January", "02": "February", "03": "March", "04": "April",
            "05": "May", "06": "June", "07": "July", "08": "August",
            "09": "September", "10": "October", "11": "November", "12": "December"
        };
        
        let formattedData = { monthly: {} };
        
        monthlyResults.forEach(row => {
            const monthKey = monthNames[row.query_month.split("-")[1]];
            formattedData.monthly[monthKey] = { total_queries: row.total_queries };
            
            statusList.forEach(status => {
                formattedData.monthly[monthKey][status] = row[status] || "0";
            });
        });
        
        return res.json(formattedData);
        
    } catch (error) {
        console.error('Error in getMonthlyQueryStats' , error.message);
        return res.status(500).json({ success: false, message: 'Internal Server Error' });
    }
};

module.exports = {logQuery, userUnitNames, correspondingDepartments, getQueriesByField, getQueryDetails, acceptOrRejectQuery, getQueriesCount, getQueriesChartData, getQueryStats, getYearlyQueryStats, getMonthlyQueryStats};