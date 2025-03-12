const {Op} = require("sequelize");
const Address = require('../models/Address');
const Buildings = require('../models/Buildings');
const BuildingLevels = require('../models/BuildingLevels');
const BuildingUnits = require('../models/BuildingUnits');
const UnitPictures = require('../models/UnitPictures');
const UserBuildingUnits = require('../models/UserBuildingUnits');
const Queries = require('../models/Queries');

const showMyProperties = async (req, res) => {
    try {
        if (!req.user || !req.user.id) {
            return res.status(401).json({ error: 'User not authenticated.' });
        }
        
        const data = await UserBuildingUnits.findAll({
            where: {
                user_id: req.user.id,
                contract_status: 1,
            },
            include: [
                {
                    model: BuildingUnits,
                    as: 'unit',
                    where: {
                        status: 'Approved',
                    },
                    attributes: ['id', 'unit_name'],
                    required: true,
                    include: [
                        {
                            model: BuildingLevels,
                            as: 'level',
                            attributes: ['level_name'],
                            required: true,
                            include: [
                                {
                                    model: Buildings,
                                    as: 'building',
                                    attributes: ['name'],
                                    required: true,
                                    include: [
                                        {
                                            model: Address,
                                            as: 'address',
                                            required: true,
                                            attributes: ['location', 'city', 'province', 'country'],
                                        },
                                    ],
                                },
                            ],
                        },
                        {
                            model: UnitPictures,
                            as: 'pictures',
                            attributes: ['file_path'],
                        },
                    ],
                },
            ],
            attributes: ['id','type','price','rent_start_date','rent_end_date','purchase_date','updated_at'],
            order: [['updated_at', 'DESC']],
        });
        
        res.status(200).json({
            myProperties: data,
        });
    } catch (error) {
        console.error("Error in showMyProperties:", error);
        res.status(500).json({
            error: 'An error occurred while fetching My Properties data.',
        });
    }
};

const myPropertyDetails = async (req, res) => {
    try {
        const id = parseInt(req.params.id, 10);
        if (isNaN(id)) {
            return res.status(400).json({ error: 'Invalid unit ID' });
        }
        if (!req.user?.id) return res.status(400).json({ error: "User ID is required" });
        
        const myUnitDetails = await UserBuildingUnits.findOne({
            where:{ id, user_id: req.user.id },
            include: [
                {
                    model: BuildingUnits,
                    as: 'unit',
                    attributes: ['id', 'unit_name'],
                    required: true,
                    include: [
                        {
                            model: BuildingLevels,
                            as: 'level',
                            attributes: ['level_name'],
                            required: true,
                            include: [
                                {
                                    model: Buildings,
                                    as: 'building',
                                    attributes: ['name'],
                                    required: true,
                                    include: [
                                        {
                                            model: Address,
                                            as: 'address',
                                            attributes: ['location', 'city', 'province', 'country'],
                                            required: true,
                                        },
                                    ],
                                },
                            ],
                        },
                        {
                            model: UnitPictures,
                            as: 'pictures',
                            attributes: ['file_path'],
                        },
                        {
                            model: Queries,
                            as: 'queries',
                            attributes: ['id', 'description', 'status', 'expected_closure_date', 'remarks', 'created_at'],
                            where: { user_id: req.user.id },
                        },
                    ],
                }
            ],
            attributes: ['id', 'price', 'type', 'rent_start_date','rent_end_date','purchase_date'],
        });
        
        res.status(200).json({
            Details: myUnitDetails,
        });
    } catch (error) {
        console.error("Error in myPropertyDetails:", error);
        res.status(500).json({ error: 'An error occurred while fetching details page data.' });
    }
};

module.exports = { showMyProperties, myPropertyDetails};
