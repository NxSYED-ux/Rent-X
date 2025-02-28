const { DataTypes } = require('sequelize');
const sequelize = require('../config/db');
const Users = require('./Users');
const BuildingUnits = require('./BuildingUnits');

const Favorites = sequelize.define('Favorites', {
    id: {
        type: DataTypes.BIGINT.UNSIGNED,
        autoIncrement: true,
        primaryKey: true,
    },
    user_id: {
        type: DataTypes.BIGINT.UNSIGNED,
        allowNull: false,
        references: {
            model: Users,
            key: 'id',
        },
    },
    unit_id: {
        type: DataTypes.BIGINT.UNSIGNED,
        allowNull: false,
        references: {
            model: BuildingUnits,
            key: 'id',
        },
    },
}, {
        tableName: 'favorites',
    timestamps: true,
    createdAt: "created_at",
    updatedAt: "updated_at"
});

Favorites.associate = (model) => {
    Favorites.belongsTo(model.Users, { foreignKey: 'user_id', as: 'user' });
    Favorites.belongsTo(model.BuildingUnits, { foreignKey: 'unit_id', as: 'unit' });
};

module.exports = Favorites;
