const Address = require('../models/Address');
const Buildings = require('../models/Buildings');
const BuildingLevels = require('../models/BuildingLevels');
const BuildingUnits = require('../models/BuildingUnits');
const UnitPictures = require('../models/UnitPictures');
const Organizations = require("../models/Organizations");
const OrganizationPictures = require("../models/OrganizationPictures");

const unitDetails = async (req, res) => {
    try {
        const id = parseInt(req.params.id, 10);
        if (isNaN(id)) {
            return res.status(400).json({ error: 'Invalid unit ID' });
        }
        const UnitDetails = await BuildingUnits.findOne({
            where:{id},
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
                    model: Organizations,
                    as: 'organization',
                    attributes: ['id', 'name'],
                    required: true,
                    include: [
                        {
                            model: OrganizationPictures,
                            as: 'pictures',
                            attributes: ['file_path'],
                        },
                    ],
                },
            ],
            attributes: ['id', 'unit_name', 'unit_type', 'price', 'sale_or_rent'],
        });

        res.status(200).json({
            unitDetails: UnitDetails,
        });
    } catch (error) {
        console.error("Error in unitDetails:", error);
        res.status(500).json({ error: error.message || 'An error occurred while fetching details page data.' });
    }
};

module.exports = { unitDetails };
