const { Op } = require('sequelize');
const Address = require('../models/Address');
const Buildings = require('../models/Buildings');
const BuildingPictures = require('../models/BuildingPictures');
const Organizations = require("../models/Organizations");
const OrganizationPictures = require("../models/OrganizationPictures");

const organizationDetails = async (req, res) => {
    try {
        const { limit = 10, offset = 0 } = req.query;
        const id = parseInt(req.params.id, 10);
        
        if (isNaN(id)) {
            return res.status(400).json({ error: 'Invalid organization ID' });
        }
        
        const organization = await Organizations.findOne({
            where: { id },
            attributes: ['name'],
            include: [
                {
                    model: OrganizationPictures,
                    as: 'pictures',
                    attributes: ['file_path'],
                },
            ],
        });
        
        if (!organization) {
            return res.status(404).json({ error: 'Organization not found' });
        }
        
        const buildings = await Buildings.findAll({
            where: {
                organization_id: id,
                status: {
                    [Op.or]: ['Approved', 'For Reapproval']
                }
            },
            attributes: ['id','name','updated_at'],
            include: [
                {
                    model: Address,
                    as: 'address',
                    attributes: ['location', 'city', 'province', 'country'],
                },
                {
                    model: BuildingPictures,
                    as: 'pictures',
                    attributes: ['file_path'],
                },
            ],
            limit: parseInt(limit, 10),
            offset: parseInt(offset, 10),
            order: [['updated_at', 'DESC']],
        });
        
        res.status(200).json({
            organization,
            buildings
        });
    } catch (error) {
        console.error('Error fetching organization details:', error);
        res.status(500).json({ error: error.message || 'An error occurred while fetching organization details.' });
    }
};

module.exports = { organizationDetails };