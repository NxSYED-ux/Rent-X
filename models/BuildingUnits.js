const { DataTypes } = require('sequelize');
const sequelize = require('../config/db');
const BuildingLevels = require('./BuildingLevels');
const Organizations = require('./Organizations');
const Buildings = require('./Buildings');
const Users = require('./Users');

const BuildingUnits = sequelize.define('BuildingUnits', {
    id: {
        type: DataTypes.BIGINT.UNSIGNED,
        autoIncrement: true,
        primaryKey: true,
    },
    level_id: {
        type: DataTypes.BIGINT.UNSIGNED,
        allowNull: false,
        references: {
            model: BuildingLevels,
            key: 'id',
        },
    },
    organization_id: {
        type: DataTypes.BIGINT.UNSIGNED,
        allowNull: false,
        references: {
            model: Organizations,
            key: 'id',
        },
    },
    building_id: {
        type: DataTypes.BIGINT.UNSIGNED,
        allowNull: false,
        references: {
            model: Buildings,
            key: 'id',
        },
    },
    unit_name: {
        type: DataTypes.STRING(50),
        allowNull: false,
    },
    unit_type: {
        type: DataTypes.STRING(50),
        allowNull: false,
        comment: '1: Room, 2: Shop, 3: Apartment, 4: Restaurant, 5: Gym',
    },
    availablity_status: {
        type: DataTypes.ENUM('Available', 'Rented', 'Sold', 'Not Available'),
        allowNull: false,
    },
    sale_or_rent: {
        type: DataTypes.ENUM('Sale', 'Rent', 'Not Available'),
        allowNull: false,
    },
    price: {
        type: DataTypes.DECIMAL(10, 2),
        allowNull: false,
        defaultValue: 0,
    },
    area: {
        type: DataTypes.DECIMAL(10, 2),
        allowNull: false,
    },
    status: {
        type: DataTypes.ENUM('Approved', 'Rejected'),
        allowNull: false,
    },
    description: {
        type: DataTypes.TEXT,
        allowNull: true,
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
    tableName: 'buildingUnits',
    timestamps: true,
    createdAt: 'created_at',
    updatedAt: 'updated_at',
});

BuildingUnits.addHook('beforeCreate', (record, options) => {
    if (options.user) {
        record.created_by = options.user.id;
        record.updated_by = options.user.id;
    } else {
        throw new Error('User not provided in options');
    }
});

BuildingUnits.addHook('beforeUpdate', (record, options) => {
    if (options.user) {
        record.updated_by = options.user.id;
    } else {
        throw new Error('User not provided in options');
    }
});

BuildingUnits.associate = (model) => {
    BuildingUnits.belongsTo(model.BuildingLevels, { foreignKey: 'level_id', as: 'level' });
    BuildingUnits.belongsTo(model.Organizations, { foreignKey: 'organization_id', as: 'organization' });
    BuildingUnits.belongsTo(model.Buildings, { foreignKey: 'building_id', as: 'building' });
    BuildingUnits.belongsTo(model.Users, { foreignKey: 'created_by', as: 'creator' });
    BuildingUnits.belongsTo(model.Users, { foreignKey: 'updated_by', as: 'updater' });

    BuildingUnits.hasMany(model.UserBuildingUnits, { foreignKey: 'unit_id', as: 'userUnits' });
    BuildingUnits.hasMany(model.UnitPictures, { foreignKey: 'unit_id', as: 'pictures' });
    BuildingUnits.hasMany(model.Favorites, { foreignKey: 'unit_id', as: 'favorites' });
    BuildingUnits.hasMany(model.Queries, { foreignKey: 'unit_id', as: 'queries' });
};

module.exports = BuildingUnits;

