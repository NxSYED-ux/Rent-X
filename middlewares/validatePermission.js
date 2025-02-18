const Permission = require('../models/Permission');
const UserPermission = require('../models/UserPermissions');
const RolePermission = require('../models/RolePermissions');

const validatePermission = (requiredPermissionName) => {
    return async (req, res, next) => {
        try {
            const userId = req.user.id;
            const userRoleId = req.user.role_id;

            if (!userId || !userRoleId) {
                return res.status(401).json({ message: 'Unauthorized: Invalid user data' });
            }

            const permission = await Permission.findOne({ where: { name: requiredPermissionName } });
            if (!permission) {
                return res.status(400).json({ message: `Invalid permission: The permission "${requiredPermissionName}" does not exist.` });
            }

            const permissionId = permission.id;
            const userPermissionExists = await UserPermission.findOne({
                where: { user_id: userId, permission_id: permissionId },
            });

            const rolePermissionExists = await RolePermission.findOne({
                where: { role_id: userRoleId, permission_id: permissionId },
            });

            if (userPermissionExists || rolePermissionExists) {
                return next();
            }
            return res.status(403).json({ message: 'Access denied: insufficient permissions' });
        } catch (error) {
            console.error('Permission validation error:', error.message);
            return res.status(500).json({ message: 'Internal server error' });
        }
    };
};

module.exports = validatePermission;
