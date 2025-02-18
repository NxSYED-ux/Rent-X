const { DataTypes } = require('sequelize');
const sequelize = require('../config/db');
const Buildings = require('./Buildings');

const BuildingDocuments = sequelize.define('BuildingDocuments', {
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
    document_type: {
        type: DataTypes.STRING(50),
        allowNull: false,
    },
}, {
    tableName: 'buildingDocuments',
    timestamps: true,
    createdAt: 'created_at',
    updatedAt: 'updated_at',
});

BuildingDocuments.associate = (model) => {
    BuildingDocuments.belongsTo(model.Buildings, { foreignKey: 'building_id', as: 'building' });
};

module.exports = BuildingDocuments;
