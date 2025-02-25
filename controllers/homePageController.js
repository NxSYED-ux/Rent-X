const { Op } = require('sequelize');
const Address = require('../models/Address');
const Buildings = require('../models/Buildings');
const BuildingLevels = require('../models/BuildingLevels');
const BuildingUnits = require('../models/BuildingUnits');
const UnitPictures = require('../models/UnitPictures');
const User = require("../models/Users");
const Favorites = require("../models/Favorites");

const homePage = async (req, res) => {
    try {
        if (!req.user?.id) return res.status(400).json({ error: "User ID is required" });
        const userData = await User.findOne({
            where: { id: req.user.id },
            attributes: ['name', 'picture'],
        });

        if (!userData) {
            return res.status(404).json({ error: 'User not found' });
        }

        const {
            search,
            minPrice,
            maxPrice,
            unitType,
            saleOrRent,
            city,
            limit = 20,
            offset = 0,
            exclude_unit,
        } = req.query;

        const filters = {
            sale_or_rent: Array.isArray(saleOrRent) && saleOrRent.length ? { [Op.in]: saleOrRent } : { [Op.ne]: 'Not Available' },
            availability_status: 'Available',
            status: 'Approved',
        };
        
        if (exclude_unit) {
            filters.id = { [Op.not]: exclude_unit };
        }
        
        if (minPrice && maxPrice) {
            filters.price = { [Op.between]: [parseFloat(minPrice), parseFloat(maxPrice)] };
        } else if (minPrice) {
            filters.price = { [Op.gte]: parseFloat(minPrice) };
        } else if (maxPrice) {
            filters.price = { [Op.lte]: parseFloat(maxPrice) };
        }
        
        if (Array.isArray(unitType) && unitType.length) {
            filters.unit_type = { [Op.in]: unitType };
        }
        
        const cityFilters = city ? { city: { [Op.eq]: city } } : {};

        let searchFilter = {};

        if (search) {
            searchFilter = {
                [Op.or]: [
                    { '$level.building.address.location$': { [Op.like]: `%${search}%` } },
                    { '$level.building.address.city$': { [Op.like]: `%${search}%` } },
                    { '$level.building.address.province$': { [Op.like]: `%${search}%` } },
                    { '$level.building.address.country$': { [Op.like]: `%${search}%` } },
                    { '$level.level_name$': { [Op.like]: `%${search}%` } },
                    { '$level.building.name$': { [Op.like]: `%${search}%` } },
                    { unit_name: { [Op.like]: `%${search}%` } },
                ]
            };
        }
        
        const availableUnits = await BuildingUnits.findAll({
            where: {
                ...filters,
                ...searchFilter,
            },
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
                                    where: Object.keys(cityFilters).length ? cityFilters : undefined,
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
            ],
            attributes: [
                'id',
                'unit_name',
                'unit_type',
                'price',
                'sale_or_rent',
                'availability_status',
                'updated_at',
            ],
            limit: parseInt(limit, 10),
            offset: parseInt(offset, 10),
            order: [['updated_at', 'DESC']],
        });
        
        res.status(200).json({
            user: userData,
            units: availableUnits,
        });
    } catch (error) {
        console.error("Error in homepage:", error);
        res.status(500).json({ error: error.message || 'An error occurred while fetching home page data.' });
    }
};

module.exports = { homePage };
