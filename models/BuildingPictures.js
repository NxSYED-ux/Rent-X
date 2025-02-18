const { DataTypes } = require('sequelize');
const sequelize = require('../config/db');
const Buildings = require('./Buildings');

const BuildingPictures = sequelize.define('BuildingPictures', {
    id: {
        type: DataTypes.BIGINT.UNSIGNED,
        autoIncrement: true,
        primaryKey: true,
    },
    building_id: {
        type: DataTypes.BIGINT.UNSIGNED,
        allowNull: false,
        references: {
            model: Buildings,
            key: 'id',
        },
    },
    file_path: {
        type: DataTypes.STRING(255),
    },
    file_name: {
        type: DataTypes.STRING(255),
        unique: true,
    },
}, {
    tableName: 'buildingPictures',
    timestamps: true,
    createdAt: 'created_at',
    updatedAt: 'updated_at',
});

BuildingPictures.associate = (model) => {
    BuildingPictures.belongsTo(model.Buildings, { foreignKey: 'building_id', as: 'building' });
};

module.exports = BuildingPictures;
