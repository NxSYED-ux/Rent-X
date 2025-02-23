const { Op } = require('sequelize');
const Address = require('../models/Address');
const Buildings = require('../models/Buildings');
const BuildingLevels = require('../models/BuildingLevels');
const BuildingUnits = require('../models/BuildingUnits');
const UnitPictures = require('../models/UnitPictures');

const specificBuildingUnits = async (req, res) => {
    try {
        const { limit = 10, offset = 0 } = req.query;
        
        const id = parseInt(req.params.id, 10);
        if (isNaN(id)) {
            return res.status(400).json({ error: 'Invalid building ID' });
        }
        
        const data = await Buildings.findOne({
            where: { id },
            include: [
                {
                    model: Address,
                    as: 'address',
                    attributes: ['location', 'city', 'province', 'country'],
                },
                {
                    model: BuildingLevels,
                    as: 'levels',
                    attributes: ['level_name'],
                    required: true,
                    include: [
                        {
                            model: BuildingUnits,
                            as: 'units',
                            where: {
                                sale_or_rent: { [Op.ne]: 'Not Available' },
                                availability_status: 'Available',
                                status: 'Approved',
                            },
                            attributes: ['id', 'unit_name', 'unit_type', 'price', 'sale_or_rent', 'availability_status', 'updated_at'],
                            required: true,
                            include: [
                                {
                                    model: UnitPictures,
                                    as: 'pictures',
                                    attributes: ['file_path'],
                                },
                            ],
                        },
                    ],
                },
            ],
            attributes: ['id', 'name'],
        });
        
        if (!data) {
            return res.status(404).json({ error: 'Building not found' });
        }
        
        res.status(200).json({ buildingUnits : data, });
    } catch (error) {
        console.error("Error in specificBuildingUnits:", error);
        res.status(500).json({ error: error.message || 'An error occurred while fetching specific Building Units.' });
    }
};

module.exports = { specificBuildingUnits };
