const { Op } = require('sequelize');
const Buildings = require('../models/Buildings');
const BuildingLevels = require('../models/BuildingLevels');
const BuildingUnits = require('../models/BuildingUnits');


const Tree = async (req, res) => {
    try {
        const id = parseInt(req.params.id, 10);
        
        if (isNaN(id)) {
            return res.status(400).json({ error: 'Invalid Building ID' });
        }
        
        const buildings = await Buildings.findAll({
            where: {
                id,
                status: {
                    [Op.or]: ['Approved', 'For Reapproval']
                }
            },
            attributes: ['name'],
            include: [
                {
                    model: BuildingLevels,
                    as: 'levels',
                    attributes: ['level_name'],
                    include: [
                        {
                            model: BuildingUnits,
                            as: 'units',
                            attributes: ['unit_name'],
                        },
                    ],
                },
            ],
        });
        
        res.status(200).json({
            buildings
        });
    } catch (error) {
        console.error('Error fetching organization details:', error);
        res.status(500).json({ error: error.message || 'An error occurred while fetching organization details.' });
    }
};

module.exports = { Tree };