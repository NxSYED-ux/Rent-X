const express = require('express');
const authMiddleware  = require('../middlewares/authMiddleware');
const validatePermission = require('../middlewares/validatePermission');
const {UserProfile, UpdateProfileData, UploadProfilePic, RemoveProfilePic} = require('../controllers/profileController');
const {homePage} = require("../controllers/homePageController");
const {unitDetails} = require('../controllers/unitDetailsController');
const {specificBuildingUnits} = require('../controllers/buildingUnitsController');
const {organizationDetails} = require('../controllers/OrganizationDetailsController');
const {showFavourites , insertFavorite, deleteFavorite} = require('../controllers/favouritesController');
const {showMyProperties, myPropertyDetails} = require('../controllers/myPropertiesController');
const {logQuery, correspondingDepartments, userUnitNames, getQueriesByField, getQueryDetails} = require('../controllers/queryController')
const { getDropdownValuesByType, getDropdownValuesByValue } = require('../controllers/dropdownController');
const { Tree, AssignUnit, UnitData } = require('../controllers/webTestingController');

const router = express.Router();

router.get('/profile', authMiddleware, validatePermission('View Profile Access'), UserProfile);
router.put('/profile', authMiddleware, validatePermission('Update Profile Access'), UpdateProfileData);
router.put('/removeProfilePic', authMiddleware, validatePermission('Remove Profile Picture Access'), RemoveProfilePic);
router.post('/updateProfilePic', authMiddleware, validatePermission('Upload Profile Picture Access'), UploadProfilePic);

router.get('/home', authMiddleware, validatePermission('User Homepage Access'), homePage);
router.get('/unit_details/:id', authMiddleware, validatePermission('User Homepage Access'), unitDetails);

router.get('/organization_details/:id', authMiddleware, validatePermission('User Homepage Access'), organizationDetails);
router.get('/building_units/:id', authMiddleware, validatePermission('User Homepage Access'), specificBuildingUnits);

router.get('/favorites', authMiddleware, validatePermission('Show Favorites Access'), showFavourites);
router.post('/favorites', authMiddleware, validatePermission('Add Favorites Access'), insertFavorite);
router.delete('/favorites/:unit_id', authMiddleware, validatePermission('Remove Favorites Access'), deleteFavorite);

router.get('/my_properties', authMiddleware, validatePermission('Show My Properties Access'), showMyProperties);
router.get('/my_properties/:id', authMiddleware, validatePermission('Show My Properties Access'), myPropertyDetails);

router.get('/my-unit-names', authMiddleware, userUnitNames);
router.get('/corresponding-departments/:organizationId', authMiddleware, correspondingDepartments);
router.post('/log-query', authMiddleware, validatePermission('Log Queries Access'), logQuery);
router.get('/get-queries', authMiddleware, validatePermission('View User Queries Access'), getQueriesByField("user_id"));
router.get('/query/:id', authMiddleware, validatePermission('View User Queries Access'), getQueryDetails);

router.get('/values-by-type/:type', getDropdownValuesByType);
router.get('/values-by-value/:value', getDropdownValuesByValue);

router.get('/BuildingTree/:id', authMiddleware, Tree);
router.get('/Unit/:id', UnitData);
router.post('/assign-unit', authMiddleware, AssignUnit);

module.exports = router;

