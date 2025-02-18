const { DataTypes } = require('sequelize');
const sequelize = require('../config/db');

const Permission = sequelize.define('Permission', {
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
    },
}, {
    tableName: 'permissions',
    timestamps: true,
    createdAt: 'created_at',
    updatedAt: 'updated_at',
});

Permission.associate = (model) => {
    Permission.hasMany(model.RolePermissions, { foreignKey: 'permission_id', as: 'rolePermissions' });
    Permission.hasMany(model.UserPermissions, { foreignKey: 'permission_id', as: 'userPermissions' });
};

module.exports = Permission;
