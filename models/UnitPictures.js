const { DataTypes } = require('sequelize');
const sequelize = require('../config/db');
const BuildingUnits = require('./BuildingUnits');

const UnitPictures = sequelize.define('UnitPictures', {
    id: {
        type: DataTypes.BIGINT.UNSIGNED,
        autoIncrement: true,
        primaryKey: true,
    },
    unit_id: {
        type: DataTypes.BIGINT.UNSIGNED,
        allowNull: false,
        references: {
            model: BuildingUnits,
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
    tableName: 'unitPictures',
    timestamps: true,
    createdAt: 'created_at',
    updatedAt: 'updated_at',
});

UnitPictures.associate = (model) => {
    UnitPictures.belongsTo(model.BuildingUnits, { foreignKey: 'unit_id', as: 'unit' });
};

module.exports = UnitPictures;
