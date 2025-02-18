const express = require('express');
const {UserProfile, UpdateProfileData, UploadProfilePic, RemoveProfilePic} = require('../controllers/profileController');
const authMiddleware  = require('../middlewares/authMiddleware');
const {getQueriesByField, getQueryDetails} = require('../controllers/queryController')

const router = express.Router();

router.get('/profile', authMiddleware(), UserProfile);
router.put('/profile', authMiddleware(), UpdateProfileData);
router.put('/removeProfilePic', authMiddleware(), RemoveProfilePic);
router.post('/updateProfilePic', authMiddleware(), UploadProfilePic);

router.get('/get-queries', authMiddleware(), getQueriesByField("staff_member_id"));
router.get('/query/:id', authMiddleware(), getQueryDetails);

module.exports = router;