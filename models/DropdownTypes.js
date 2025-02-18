const { DataTypes } = require('sequelize');
const sequelize = require('../config/db');

const DropdownTypes = sequelize.define("DropdownTypes", {
    id: {
        type: DataTypes.INTEGER.UNSIGNED,
        autoIncrement: true,
        primaryKey: true
    },
    type_name: {
        type: DataTypes.STRING(50),
        allowNull: false,
        unique: true
    },
    description: {
        type: DataTypes.TEXT,
        allowNull: true
    },
    parent_value_id: {
        type: DataTypes.INTEGER.UNSIGNED,
        allowNull: true,
        references: {
            model: "DropdownTypes",
            key: "id"
        }
    },
    status: {
        type: DataTypes.TINYINT,
        allowNull: false,
        defaultValue: 1
    },
    created_at: {
        type: DataTypes.DATE,
        allowNull: true,
        defaultValue: DataTypes.NOW
    },
    updated_at: {
        type: DataTypes.DATE,
        allowNull: true,
        defaultValue: DataTypes.NOW
    }
}, {
    tableName: "dropdowntypes",
    timestamps: true,
    createdAt: "created_at",
    updatedAt: "updated_at"
});

DropdownTypes.associate = (model) => {
    DropdownTypes.belongsTo(model.DropdownTypes, { foreignKey: "parent_value_id", as: "parent" });
    
    DropdownTypes.hasMany(model.DropdownTypes, { foreignKey: "parent_value_id", as: "childs" });
    DropdownTypes.hasMany(model.DropdownValues, { foreignKey: "dropdown_type_id", as: "values" });
};

module.exports = DropdownTypes;