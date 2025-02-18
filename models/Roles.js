const { DataTypes } = require('sequelize');
const sequelize = require('../config/db');

const Roles = sequelize.define('Roles', {
    id: {
        type: DataTypes.INTEGER.UNSIGNED,
        autoIncrement: true,
        primaryKey: true,
    },
    name: {
        type: DataTypes.STRING(25),
        allowNull: false,
        unique: true,
    },
    description: {
        type: DataTypes.TEXT,
    },
    status: {
        type: DataTypes.TINYINT,
        allowNull: false,
    },
}, {
    tableName: 'roles',
    timestamps: true,
    createdAt: 'created_at',
    updatedAt: 'updated_at',
});

Roles.associate = (model) => {
    Roles.hasMany(model.Users, { foreignKey: 'role_id' , as: 'users'});
    Roles.hasMany(model.RolePermissions, { foreignKey: 'role_id' , as: 'rolePermissions'});
};

module.exports = Roles;