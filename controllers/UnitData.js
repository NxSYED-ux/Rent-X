const { Op } = require('sequelize');
const BuildingUnits = require('../models/BuildingUnits');
const UserBuildingUnits = require('../models/UserBuildingUnits');
const UnitPictures = require("../models/UnitPictures");
const Users = require('../models/Users');

const UnitData = async (req, res) => {
    try {
        const id = parseInt(req.params.id, 10);
        
        if (isNaN(id)) {
            return res.status(400).json({ error: 'Invalid Unit ID' });
        }
        
        const data = await BuildingUnits.findOne({
            where: { id },
            include: [
                {
                    model: UnitPictures,
                    as: 'pictures',
                    attributes: ['file_path'],
                },
                {
                    model: UserBuildingUnits,
                    as: 'userUnits',
                    where: { contract_status: 1 },
                    required: false,
                    attributes: ['user_id', 'rent_start_date', 'rent_end_date', 'purchase_date'],
                    include: [
                        {
                            model: Users,
                            as: 'user',
                            attributes: ['name', 'picture'],
                        }
                    ],
                },
            ],
            attributes: ['id', 'unit_name', 'unit_type', 'price', 'sale_or_rent'],
        });
        
        if (!data) {
            return res.status(404).json({ error: 'Unit not found' });
        }
        
        const modifiedData = {
            ...data.toJSON(),
            userUnits: data.userUnits.map(userUnit => {
                const filteredUserUnit = { user_id: userUnit.user_id };
                
                if (userUnit.rent_start_date) {
                    filteredUserUnit.rent_start_date = userUnit.rent_start_date;
                    filteredUserUnit.rent_end_date = userUnit.rent_end_date;
                }
                
                if (userUnit.purchase_date) {
                    filteredUserUnit.purchase_date = userUnit.purchase_date;
                }
                
                if (userUnit.user) {
                    filteredUserUnit.user = userUnit.user;
                }
                
                return filteredUserUnit;
            })
        };
        
        res.status(200).json({ Unit: modifiedData });
    } catch (error) {
        console.error('Error fetching Unit Data:', error);
        res.status(500).json({ error: 'An error occurred while fetching unit data.' });
    }
};


module.exports = { UnitData };