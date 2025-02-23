const { DataTypes } = require('sequelize');
const sequelize = require('../config/db');
const Roles = require('./Roles');
const Permissions = require('./Permissions');
const Users = require('./Users');

const RolePermissions = sequelize.define('RolePermissions', {
    id: {
        type: DataTypes.INTEGER.UNSIGNED,
        autoIncrement: true,
        primaryKey: true,
    },
    role_id: {
        type: DataTypes.INTEGER.UNSIGNED,
        allowNull: false,
        references: {
            model: Roles,
            key: 'id',
        },
    },
    permission_id: {
        type: DataTypes.INTEGER.UNSIGNED,
        allowNull: false,
        references: {
            model: Permissions,
            key: 'id',
        },
    },
    status: {
        type: DataTypes.TINYINT,
        allowNull: false,
        defaultValue: 1,
    },
    granted_by: {
        type: DataTypes.BIGINT.UNSIGNED,
        allowNull: true,
        references: {
            model: Users,
            key: 'id',
        },
    },
}, {
    tableName: 'rolePermissions',
    timestamps: true,
    createdAt: 'created_at',
    updatedAt: 'updated_at',
});

RolePermissions.associate = (model) => {
    RolePermissions.belongsTo(model.Roles, { foreignKey: 'role_id', as: 'role' });
    RolePermissions.belongsTo(model.Permissions, { foreignKey: 'permission_id', as: 'permission' });
    RolePermissions.belongsTo(model.Users, { foreignKey: 'granted_by', as: 'grantedBy' });
};

module.exports = RolePermissions;
