const { DataTypes } = require('sequelize');
const sequelize = require('../config/db');
const Buildings = require('./Buildings');
const Users = require('./Users');

const BuildingLevels = sequelize.define('BuildingLevels', {
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
    level_name: {
        type: DataTypes.STRING(50),
        allowNull: false,
    },
    description: {
        type: DataTypes.TEXT,
    },
    level_number: {
        type: DataTypes.INTEGER,
        allowNull: false,
    },
    status: {
        type: DataTypes.ENUM('approved', 'rejected'),
        allowNull: false,
    },
    created_by: {
        type: DataTypes.BIGINT.UNSIGNED,
        allowNull: false,
        references: {
            model: Users,
            key: 'id',
        },
    },
    updated_by: {
        type: DataTypes.BIGINT.UNSIGNED,
        allowNull: false,
        references: {
            model: Users,
            key: 'id',
        },
    },
}, {
    tableName: 'buildingLevels',
    timestamps: true,
    createdAt: 'created_at',
    updatedAt: 'updated_at',
});

BuildingLevels.addHook('beforeCreate', (record, options) => {
    if (options.user) {
        record.created_by = options.user.id;
        record.updated_by = options.user.id;
    } else {
        throw new Error('User not provided in options');
    }
});

BuildingLevels.addHook('beforeUpdate', (record, options) => {
    if (options.user) {
        record.updated_by = options.user.id;
    } else {
        throw new Error('User not provided in options');
    }
});

BuildingLevels.associate = (model) => {
    BuildingLevels.belongsTo(model.Buildings, { foreignKey: 'building_id', as: 'building' });
    BuildingLevels.belongsTo(model.Users, { foreignKey: 'created_by', as: 'creator' });
    BuildingLevels.belongsTo(model.Users, { foreignKey: 'updated_by', as: 'updater' });

    BuildingLevels.hasMany(model.BuildingUnits, { foreignKey: 'level_id', as: 'units' });
};

module.exports = BuildingLevels;