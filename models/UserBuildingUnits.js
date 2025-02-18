const { DataTypes } = require('sequelize');
const sequelize = require('../config/db');
const Users = require('./Users');
const BuildingUnits = require('./BuildingUnits');

const UserBuildingUnits = sequelize.define('UserBuildingUnits', {
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
    type: {
        type: DataTypes.ENUM('Rented', 'Sold'),
        allowNull: false,
    },
    price: {
        type: DataTypes.DECIMAL(10, 2),
        allowNull: false,
    },
    rent_start_date: {
        type: DataTypes.DATEONLY,
    },
    rent_end_date: {
        type: DataTypes.DATEONLY,
    },
    purchase_date: {
        type: DataTypes.DATEONLY,
    },
    contract_status: {
        type: DataTypes.TINYINT,
        allowNull: false,
        defaultValue: 1,
    },
    created_by: {
        type: DataTypes.BIGINT.UNSIGNED,
        references: {
            model: Users,
            key: 'id',
        },
    },
    updated_by: {
        type: DataTypes.BIGINT.UNSIGNED,
        references: {
            model: Users,
            key: 'id',
        },
    },
}, {
    tableName: 'userBuildingUnits',
    timestamps: true,
    createdAt: 'created_at',
    updatedAt: 'updated_at',
});

UserBuildingUnits.addHook('beforeCreate', (record, options) => {
    if (options.user) {
        record.created_by = options.user.id;
        record.updated_by = options.user.id;
    } else {
        throw new Error('User not provided in options');
    }
});

UserBuildingUnits.addHook('beforeUpdate', (record, options) => {
    if (options.user) {
        record.updated_by = options.user.id;
    } else {
        throw new Error('User not provided in options');
    }
});

UserBuildingUnits.associate = (model) => {
    UserBuildingUnits.belongsTo(model.Users, { foreignKey: 'user_id', as: 'user' });
    UserBuildingUnits.belongsTo(model.BuildingUnits, { foreignKey: 'unit_id', as: 'unit' });
    UserBuildingUnits.belongsTo(model.Users, { foreignKey: 'created_by', as: 'creator' });
    UserBuildingUnits.belongsTo(model.Users, { foreignKey: 'updated_by', as: 'updater' });
    
    UserBuildingUnits.hasMany(model.UserUnitPictures, { foreignKey: 'user_unit_id', as: 'pictures' });
};

module.exports = UserBuildingUnits;
