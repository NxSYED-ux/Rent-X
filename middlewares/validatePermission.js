const Permission = require('../models/Permissions');
const UserPermission = require('../models/UserPermissions');
const RolePermission = require('../models/RolePermissions');
const Users = require('../models/Users');

const validatePermission = (requiredPermissionName) => {
    return async (req, res, next) => {
        try {
            const userId = req.user.id;
            const userRoleId = req.user.role_id;
            
            if (!userId || !userRoleId) {
                return res.status(401).json({ error: 'Unauthorized: Invalid user data' });
            }

            const checkPermission = await Permission.findOne({ where: { name: requiredPermissionName, status: 1 }, attributes: ['id'] });
            if (!checkPermission) {
                return res.status(400).json({ error: `Access Denied: The permission for "${requiredPermissionName}" is either inactive or does not exist.` });
            }

            const permissionId = checkPermission.id;
            
            const [userPermissionExists, rolePermissionExists] = await Promise.all([
                UserPermission.findOne({
                    where: { user_id: userId, permission_id: permissionId },
                }),
                RolePermission.findOne({
                    where: { role_id: userRoleId, permission_id: permissionId },
                }),
            ]);
            
            if (userPermissionExists || rolePermissionExists) {
                return next();
            }
            return res.status(403).json({ error: 'Access denied: insufficient permissions' });
        } catch (error) {
            console.error('Permission validation error:', error.message);
            return res.status(500).json({ error: 'Internal server error' });
        }
    };
};

module.exports = validatePermission;
