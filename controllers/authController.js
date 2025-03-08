const bcrypt = require('bcrypt');
const fs = require('fs');
const path = require('path');
const jwt = require("jsonwebtoken");
require('dotenv').config();
const User = require('../models/Users');
const Roles = require('../models/Roles');
const Permissions = require('../models/Permissions');
const RolePermissions = require('../models/RolePermissions');
const UserPermissions = require('../models/UserPermissions');

const { generateToken, verifyToken } = require('../utils/jwt');
const sendEmail = require('../Services/sendEmail');


const userAppPermissions = [
    "User Homepage Access",
    "Show Favorites Access",
    "Add Favorites Access",
    "Remove Favorites Access",
    "Show My Properties Access",
    "Log Queries Access",
    "View User Queries Access"
];

const staffAppPermissions = [
    "View Staff Queries Access"
];

const login = (appIdentifier) => async (req, res) => {
    const { email, password } = req.body;
    if (!email || !password) return res.status(400).json({ error: 'Email and password are required' });
    
    try {
        const user = await User.findOne({
            where: { email },
            attributes: ['id', 'password', 'role_id'],
        });
        
        if (!user) return res.status(401).json({ error: 'Invalid email or password' });
        
        const hashedPassword = user.password.startsWith('$2y$')
            ? user.password.replace('$2y$', '$2a$')
            : user.password;
        
        const isPasswordValid = await bcrypt.compare(password, hashedPassword);
        if (!isPasswordValid) return res.status(401).json({ error: 'Invalid email or password' });
        
        const [userPermissionRecords, rolePermissionRecords] = await Promise.all([
            UserPermissions.findAll({
                where: { user_id: user.id },
                include: [{ model: Permissions, as: 'permission', attributes: ['name'] }]
            }),
            RolePermissions.findAll({
                where: { role_id: user.role_id },
                include: [{ model: Permissions, as: 'permission', attributes: ['name'] }]
            })
        ]);
        
        const userPermissionNames = userPermissionRecords.map(up => up.permission.name);
        const rolePermissionNames = rolePermissionRecords.map(rp => rp.permission.name);
        const allPermissions = [...new Set([...userPermissionNames, ...rolePermissionNames])];
        
        const lowerAppIdentifier = appIdentifier.toLowerCase();
        const appPermissions = lowerAppIdentifier === 'user' ? userAppPermissions : staffAppPermissions;
        const hasAccess = allPermissions.some(permission => appPermissions.includes(permission));
        
        if (!hasAccess) {
            return res.status(403).json({ error: "Access Denied: You do not have the required permissions to log in." });
        }
        return res.status(200).json({
            message: 'Login successful',
            token: generateToken({ id: user.id, role_id: user.role_id })
        });
        
    } catch (error) {
        console.error("Error in login:", error);
        return res.status(500).json({ error: 'Internal server error' });
    }
};

const logout = async (req, res) => {
    try {
        const token = req.headers.authorization?.split(' ')[1];
        
        if (!token) return res.status(400).json({ error: 'No token provided' });
        
        return res.status(200).json({ message: 'Logout successful' });
    } catch (error) {
        console.error("Error in logout:", error);
        return res.status(500).json({ message: 'Internal server error' });
    }
};

const forgetPassword = async (req, res) => {
    const { email } = req.body;
    
    if (!email) return res.status(400).json({ error: 'Email is required' });
    
    try {
        const user = await User.findOne({ where: { email } });
        
        if (!user) return res.status(401).json({ error: 'Invalid Email' });
        
        const expirationTime = 5;
        const token = jwt.sign(
            { message: 'Reset Token' },
            process.env.JWT_SECRET_KEY,
            { expiresIn: '5m'}
        );
        
        const storeToken = await User.update(
            {
                reset_token: token,
            },
            { where: { id: user.id } }
        );
        
        if (storeToken[0] === 0) return res.status(404).json({ error: 'Unable to store token in db.' });
        
        const link = `${process.env.React_Reset_URL}/${token}`;
        const templatePath = path.join(__dirname, '../Templates/resetPassword.html');
        
        fs.readFile(templatePath, 'utf8', (err, htmlTemplate) => {
            
            if (err) return res.status(500).json({ error: 'Internal Server Error while reading email template.' });
            
            const emailContent = htmlTemplate
                .replace('{{name}}', user.name)
                .replace('{{resetLink}}', link)
                .replace('{{expirationTime}}', expirationTime);
            
            sendEmail(
                email,
                'Forget Password Link',
                `Click here to reset your password: ${link}`,
                emailContent
            );
        });
        return res.status(200).json({ message: 'Password reset link sent to your email!' });
    } catch (error) {
        console.error("Error in forgetPassword:", error);
        return res.status(500).json({ error: 'Internal server error' });
    }
};

const validateResetPassword = async (req, res) => {
    const { token } = req.params;
    
    if (!token) {
        return res.status(400).json({ error: 'Token is required.' });
    }
    
    try {
        if (jwt.verify(token, process.env.JWT_SECRET_KEY)) {
            const user = await User.findOne({ where: { reset_token: token } });
            
            if (!user)  return res.status(400).json({ error: 'This Link is already used.' });
            else        return res.status(200).json({ error: 'Token is valid.' });
            
        } else {
            return res.status(400).json({ error: 'Invalid token.' });
        }
    } catch (error) {
        if (error.name === 'TokenExpiredError') return res.status(400).json({ error: 'Token has expired.' });
        console.error("Error in validateResetPassword:", error);
        return res.status(500).json({ message: 'Internal server error.' });
    }
};

const resetPassword = async (req, res) => {
    try {
        const { token, newPassword } = req.body;
        if (!token || !newPassword) return res.status(400).json({ error: 'Token and new password are required.' });
        
        const decoded = jwt.verify(token, process.env.JWT_SECRET_KEY);
        
        const user = await User.findOne({ where: { reset_token: token } });
        if (!user) {
            return res.status(400).json({ error: 'Invalid or expired token.' });
        }
        const hashedPassword = await bcrypt.hash(newPassword, 10);
        await User.update(
            { password: hashedPassword, reset_token: null },
            { where: { id: user.id } }
        );
        return res.status(200).json({ message: 'Password reset successful.' });
    } catch (error) {
        if (error.name === 'TokenExpiredError') return res.status(400).json({ error: 'Token has expired.' });
        console.error("Error in resetPassword:", error);
        return res.status(500).json({ error: 'Internal server error. Please try again later.' });
    }
};

module.exports = { login, logout, forgetPassword, validateResetPassword, resetPassword};
