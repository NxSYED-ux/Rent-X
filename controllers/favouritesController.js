const { Op } = require('sequelize');
const Address = require('../models/Address');
const Buildings = require('../models/Buildings');
const BuildingLevels = require('../models/BuildingLevels');
const BuildingUnits = require('../models/BuildingUnits');
const UnitPictures = require('../models/UnitPictures');
const Favorites = require('../models/Favorites');

const showFavourites = async (req, res) => {
    try {
        const { limit = 10, offset = 0 } = req.query;
        
        if (!req.user || !req.user.id) {
            return res.status(401).json({ error: 'User not authenticated.' });
        }
        
        const data = await Favorites.findAll({
            where: { user_id: req.user.id },
            include: [
                {
                    model: BuildingUnits,
                    as: 'unit',
                    where: {
                        sale_or_rent: { [Op.ne]: 'Not Available' },
                        availability_status: 'Available',
                        status: 'Approved',
                    },
                    attributes: ['id', 'unit_name', 'unit_type', 'level_id', 'price', 'sale_or_rent'],
                    required: true,
                    include: [
                        {
                            model: BuildingLevels,
                            as: 'level',
                            attributes: ['level_name'],
                            include: [
                                {
                                    model: Buildings,
                                    as: 'building',
                                    attributes: ['name'],
                                    include: [
                                        {
                                            model: Address,
                                            as: 'address',
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
            attributes: ['id','created_at'],
            limit: parseInt(limit, 10),
            offset: parseInt(offset, 10),
            order: [['created_at', 'DESC']],
        });
        
        res.status(200).json({
            favorites: data,
        });
    } catch (error) {
        res.status(500).json({
            error: error.message || 'An error occurred while fetching favorites data.',
        });
    }
};

const insertFavorite = async (req, res) => {
    try {
        const { unit_id } = req.body;
        
        if (isNaN(unit_id)) {
            return res.status(400).json({ error: 'Invalid unit ID' });
        }
        
        if (!req.user || !req.user.id) {
            return res.status(401).json({ error: 'User not authenticated.' });
        }
        
        if (!unit_id) {
            return res.status(400).json({ error: 'Unit ID is required.' });
        }
        
        const existingFavorite = await Favorites.findOne({
            where: {
                user_id: req.user.id,
                unit_id,
            },
        });
        
        if (existingFavorite) {
            return res.status(409).json({ error: 'This unit is already in your favorites.' });
        }
        
        const newFavorite = await Favorites.create({
            user_id: req.user.id,
            unit_id,
        });
        
        res.status(201).json({
            message: 'Favorite added successfully.',
        });
    } catch (error) {
        res.status(500).json({
            error: error.message || 'An error occurred while adding the favorite.',
        });
    }
};

const deleteFavorite = async (req, res) => {
    try {
        const { unit_id } = req.params;
        if (isNaN(unit_id)) {
            return res.status(400).json({ error: 'Invalid unit ID.' });
        }
        
        if (!req.user || !req.user.id) {
            return res.status(401).json({ error: 'User not authenticated.' });
        }
        
        const existingFavorite = await Favorites.findOne({
            where: {
                user_id: req.user.id,
                unit_id: unit_id,
            },
        });
        
        if (!existingFavorite) {
            return res.status(404).json({ error: 'Favorite not found.' });
        }
        await existingFavorite.destroy();
        
        res.status(200).json({ message: 'Favorite deleted successfully.' });
    } catch (error) {
        console.error('Error deleting favorite:', error);
        res.status(500).json({
            error: error.message || 'An error occurred while deleting the favorite.',
        });
    }
};

module.exports = { showFavourites, insertFavorite, deleteFavorite};
