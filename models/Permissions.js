const { DataTypes } = require('sequelize');
const sequelize = require('../config/db');

const Permissions = sequelize.define('Permission', {
    id: {
        type: DataTypes.INTEGER.UNSIGNED,
        autoIncrement: true,
        primaryKey: true,
    },
    name: {
        type: DataTypes.STRING(255),
        allowNull: false,
        unique: true,
    },
    description: {
        type: DataTypes.TEXT,
        allowNull: true,
    },
    status: {
        type: DataTypes.TINYINT,
        allowNull: false,
        defaultValue: 1,
    },
}, {
    tableName: 'permissions',
    timestamps: true,
    createdAt: 'created_at',
    updatedAt: 'updated_at',
});

Permissions.associate = (model) => {
    Permissions.hasMany(model.RolePermissions, { foreignKey: 'permission_id', as: 'rolePermissions' });
    Permissions.hasMany(model.UserPermissions, { foreignKey: 'permission_id', as: 'userPermissions' });
};

module.exports = Permissions;
