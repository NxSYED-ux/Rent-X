const sequelize = require('../config/db');
const fs = require('fs');
const axios = require('axios');
const FormData = require('form-data');
const User = require('../models/Users');
const Address = require('../models/Address');

const UserProfile = async (req, res) => {
    try {
        if (!req.user?.id) return res.status(400).json({ error: "User ID is required" });
        const data = await User.findOne({
            where: {
                id: req.user.id,
            },
            include: [
                {
                    model: Address,
                    as: 'address',
                    attributes: ['location', 'city', 'province', 'country'],
                    required: true,
                },
            ],
            attributes: ['name', 'email', 'phone_no', 'cnic', 'gender', 'picture', 'date_of_birth'],
        });

        if (!data) {
            return res.status(404).json({ error: 'No available data' });
        }

        res.status(200).json({user: data});
    } catch (error) {
        console.error("Error in UserProfile:", error);
        res.status(500).json({ error: error.message || 'An error occurred while fetching user profile data.' });
    }
};

const UpdateProfileData = async (req, res) => {
    let transaction;
    
    try {
        transaction = await sequelize.transaction();
        
        const userId = req.user?.id;
        if (!userId) return res.status(400).json({ error: "User ID is required." });
        
        const {
            name,
            phone_no,
            cnic,
            gender,
            date_of_birth,
            address: { location, city, province, country } = {},
        } = req.body;
        
        if (!name) {
            return res.status(400).json({ error: "Name is required." });
        }
        
        const [userUpdated] = await User.update(
            { name, phone_no, cnic, gender, date_of_birth },
            { where: { id: userId }, transaction }
        );
        
        if (!userUpdated) {
            await transaction.rollback();
            return res.status(404).json({ error: "User not found or no changes detected." });
        }
        
        if (location || city || province || country) {
            const user = await User.findOne({
                where: { id: userId },
                attributes: ["address_id"],
                transaction,
            });
            
            if (!user?.address_id) {
                await transaction.rollback();
                return res.status(404).json({ error: "Address not found for the user." });
            }
            
            const [addressUpdated] = await Address.update(
                { location, city, province, country },
                { where: { id: user.address_id }, transaction }
            );
            
            if (!addressUpdated) {
                await transaction.rollback();
                return res.status(404).json({ error: "Address not found or no changes detected." });
            }
        }
        
        await transaction.commit();
        return res.status(200).json({ message: "Profile updated successfully." });
        
    } catch (error) {
        if (transaction) await transaction.rollback();
        console.error("Error in UpdateProfileData:", error);
        return res.status(500).json({ error: error.message || "An error occurred while updating the profile." });
    }
};

const UploadProfilePic = async (req, res) => {
    try {
        const userId = req.user?.id;
        if (!userId) return res.status(400).json({ error: "User ID is required" });
        
        if (!req.files || !req.files.picture) {
            return res.status(400).json({ error: 'Image file is required.' });
        }
        
        const picture = req.files.picture;
        const tempFilePath = picture.tempFilePath;
        
        if (!picture.mimetype.startsWith('image/')) {
            return res.status(400).json({ error: 'Invalid image file.' });
        }
        
        if (picture.size > 2 * 1024 * 1024) {
            return res.status(400).json({ error: 'Image size must be less than 2MB.' });
        }
        
        const user = await User.findOne({
            where: { id: userId },
            attributes: ['picture'],
        });
        
        const formData = new FormData();
        const folder = `users`;
        formData.append('Folder', folder);
        formData.append('pictures[]', fs.createReadStream(tempFilePath), picture.name);
        
        const response = await axios.post(`${process.env.PHP_Server_URL}/upload-images`, formData, {
            headers: { ...formData.getHeaders() },
        });
        
        if (!response.data.paths || response.data.paths.length === 0) {
            return res.status(500).json({ error: 'Failed to upload image to PHP server.' });
        }
        
        const newProfilePicPath = response.data.paths[0];
        
        const deletionTasks = [];
        
        deletionTasks.push(
            new Promise((resolve) => {
                fs.unlink(tempFilePath, (unlinkErr) => {
                    if (unlinkErr) {
                        console.error('Failed to delete temp file:', unlinkErr);
                    }
                    resolve();
                });
            })
        );
        
        if (user && user.picture) {
            const previousPicturePath = user.picture;
            deletionTasks.push(
                axios.post(`${process.env.PHP_Server_URL}/destroy-image`, { path: previousPicturePath })
                    .catch((err) => console.error('Error calling delete picture API:', err))
            );
        }
        
        await Promise.all(deletionTasks);
        
        await User.update(
            { picture: newProfilePicPath },
            { where: { id: userId } }
        );
        
        res.status(200).json({
            message: 'Profile picture updated successfully!',
            path: newProfilePicPath,
        });
        
    } catch (error) {
        console.error('Error in UploadProfilePic:', error);
        res.status(500).json({ error: error.message || 'An error occurred while changing profile picture.' });
    }
};

const RemoveProfilePic = async (req, res) => {
    try {
        const userId = req.user?.id;
        if (!userId) return res.status(400).json({ error: "User ID is required" });
        
        const user = await User.findOne({
            where: { id: userId },
            attributes: ['picture'],
        });
        
        if (!user) {
            return res.status(404).json({ error: "User not found." });
        }
        
        if (user.picture) {
            try {
                await axios.post(`${process.env.PHP_Server_URL}/destroy-image`, { path: user.picture });
            } catch (err) {
                return res.status(500).json({ error: "Error deleting profile picture from server." });
            }
        }
        
        await User.update(
            { picture: null },
            { where: { id: userId } }
        );
        
        res.status(200).json({
            message: "Profile picture removed successfully!",
        });
        
    } catch (error) {
        console.error("Error in RemoveProfilePic:", error);
        res.status(500).json({ error: error.message || "An error occurred while removing profile picture." });
    }
};

module.exports = { UserProfile , UpdateProfileData, UploadProfilePic, RemoveProfilePic };
