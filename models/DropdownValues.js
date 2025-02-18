const { DataTypes } = require('sequelize');
const sequelize = require('../config/db');
const DropdownTypes = require("./DropdownTypes");

const DropdownValues = sequelize.define("DropdownValues", {
    id: {
        type: DataTypes.INTEGER.UNSIGNED,
        autoIncrement: true,
        primaryKey: true
    },
    value_name: {
        type: DataTypes.STRING(50),
        allowNull: false,
        unique: true
    },
    description: {
        type: DataTypes.TEXT,
        allowNull: true
    },
    dropdown_type_id: {
        type: DataTypes.INTEGER.UNSIGNED,
        allowNull: false,
        references: {
            model: DropdownTypes,
            key: "id"
        }
    },
    parent_value_id: {
        type: DataTypes.INTEGER.UNSIGNED,
        allowNull: true,
        references: {
            model: "DropdownValues",
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
    tableName: "dropdownvalues",
    timestamps: true,
    createdAt: "created_at",
    updatedAt: "updated_at"
});

DropdownTypes.associate = (model) => {
    DropdownValues.belongsTo(model.DropdownTypes, { foreignKey: "dropdown_type_id", as: "dropdownType" });
    DropdownValues.belongsTo(model.DropdownValues, { foreignKey: "parent_value_id", as: "parent" });
    
    DropdownValues.hasMany(model.DropdownValues, { foreignKey: "parent_value_id", as: "childs" });
};

module.exports = DropdownValues;
