const { DataTypes } = require('sequelize');
const sequelize = require('../config/db');

const Address = sequelize.define('Address', {
    id: {
        type: DataTypes.BIGINT.UNSIGNED,
        autoIncrement: true,
        primaryKey: true
    },
    location: {
        type: DataTypes.STRING,
    },
    country: { 
        type: DataTypes.STRING,
    },
    province: { 
        type: DataTypes.STRING 
    },
    city: { 
        type: DataTypes.STRING
    },
    postal_code: { 
        type: DataTypes.STRING
    },
}, {
    tableName: 'address',
    timestamps: true,
    createdAt: 'created_at',
    updatedAt: 'updated_at',
});

Address.associate = (model) => {
    Address.hasMany(model.Users, { foreignKey: 'address_id', as: 'users' });
    Address.hasMany(model.Organizations, { foreignKey: 'address_id', as: 'organizations' });
    Address.hasMany(model.Buildings, { foreignKey: 'address_id', as: 'buildings' });
};

module.exports = Address;