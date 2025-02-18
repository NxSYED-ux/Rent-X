const express = require('express');
const {UserProfile, UpdateProfileData, UploadProfilePic, RemoveProfilePic} = require('../controllers/profileController');
const authMiddleware  = require('../middlewares/authMiddleware');
const {homePage} = require("../controllers/homePageController");
const {unitDetails} = require('../controllers/unitDetailsController');
const {specificBuildingUnits} = require('../controllers/buildingUnitsController');
const {organizationDetails} = require('../controllers/OrganizationDetailsController');
const {showFavourites , insertFavorite, deleteFavorite} = require('../controllers/favouritesController');
const {showMyProperties, myPropertyDetails} = require('../controllers/myPropertiesController');
const {logQuery, correspondingDepartments, userUnitNames, getQueriesByField, getQueryDetails} = require('../controllers/queryController')
const { Tree } = require('../controllers/Tree');
const { UnitData } = require('../controllers/UnitData');

const router = express.Router();

router.get('/profile', authMiddleware(), UserProfile);
router.put('/profile', authMiddleware(), UpdateProfileData);
router.put('/removeProfilePic', authMiddleware(), RemoveProfilePic);
router.post('/updateProfilePic', authMiddleware(), UploadProfilePic);

router.get('/home', authMiddleware(), homePage);
router.get('/unit_details/:id', authMiddleware(), unitDetails);

router.get('/organization_details/:id', authMiddleware(), organizationDetails);
router.get('/building_units/:id', authMiddleware(), specificBuildingUnits);

router.get('/favorites', authMiddleware(), showFavourites);
router.post('/favorites', authMiddleware(), insertFavorite);
router.delete('/favorites/:unit_id', authMiddleware(), deleteFavorite);

router.get('/my_properties', authMiddleware(), showMyProperties);
router.get('/my_properties/:id', authMiddleware(), myPropertyDetails);

router.get('/my-unit-names', authMiddleware(), userUnitNames);
router.get('/corresponding-departments/:organizationId', authMiddleware(), correspondingDepartments);
router.post('/log-query', authMiddleware(), logQuery);
router.get('/get-queries', authMiddleware(), getQueriesByField("user_id"));
router.get('/query/:id', authMiddleware(), getQueryDetails);

router.get('/BuildingTree/:id', authMiddleware(), Tree);

router.get('/Unit/:id', UnitData);

module.exports = router;