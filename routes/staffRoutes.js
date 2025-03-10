const express = require('express');
const authMiddleware  = require('../middlewares/authMiddleware');
const validatePermission = require("../middlewares/validatePermission");
const {UserProfile, UpdateProfileData, UploadProfilePic, RemoveProfilePic} = require('../controllers/profileController');
const {getQueriesByField, getQueryDetails, acceptOrRejectQuery} = require('../controllers/queryController')

const router = express.Router();

router.get('/profile', authMiddleware, validatePermission('View Profile Access'), UserProfile);
router.put('/profile', authMiddleware, validatePermission('Update Profile Access'), UpdateProfileData);
router.put('/removeProfilePic', authMiddleware, validatePermission('Remove Profile Picture Access'), RemoveProfilePic);
router.post('/updateProfilePic', authMiddleware, validatePermission('Upload Profile Picture Access'), UploadProfilePic);

router.get('/get-queries', authMiddleware, validatePermission('View Staff Queries Access'), getQueriesByField("staff_member_id"));
router.get('/query/:id', authMiddleware, validatePermission('View Staff Queries Access'), getQueryDetails);
router.put('/reject-query', authMiddleware, acceptOrRejectQuery('Rejected'));
router.put('/accept-query', authMiddleware, acceptOrRejectQuery('Accept'));

module.exports = router;