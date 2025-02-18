const express = require('express');
const { login, logout, forgetPassword, resetPassword, validateResetPassword} = require('../controllers/authController');
const router = express.Router();

router.post('/user-login', login('user'));
router.post('/staff-login', login('staff'));
router.post('/logout', logout);
router.post('/forgetPassword', forgetPassword);
router.get('/ResetPassword/:token',validateResetPassword);
router.post('/ResetPassword',resetPassword);

module.exports = router;