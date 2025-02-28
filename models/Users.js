const { DataTypes } = require('sequelize');
const sequelize = require('../config/db');
const Roles = require('./Roles');
const Address = require('./Address');

const Users = sequelize.define('Users', {
    id: {
        type: DataTypes.BIGINT.UNSIGNED,
        autoIncrement: true,
        primaryKey: true,
    },
    role_id: {
        type: DataTypes.INTEGER.UNSIGNED,
        allowNull: false,
        references: {
            model: Roles,
            key: 'id',
        },
    },
    name: {
        type: DataTypes.STRING(50),
        allowNull: false,
    },
    email: {
        type: DataTypes.STRING(255),
        allowNull: false,
        unique: true,
    },
    password: {
        type: DataTypes.STRING(255),
        allowNull: false,
    },
    reset_token: {
        type: DataTypes.STRING(255),
        allowNull: true,
    },
    cnic: {
        type: DataTypes.STRING(25),
        allowNull: false,
    },
    phone_no: {
        type: DataTypes.STRING(20),
    },
    status: {
        type: DataTypes.TINYINT,
        allowNull: false,
        defaultValue: 1,
    },
    date_of_birth: {
        type: DataTypes.DATE,
        allowNull: false,
    },
    gender: {
        type: DataTypes.ENUM('Male', 'Female', 'Other'),
        allowNull: false,
    },
    picture: {
        type: DataTypes.STRING(255),
    },
    address_id: {
        type: DataTypes.BIGINT.UNSIGNED,
        allowNull: false,
        unique: true,
        references: {
            model: Address,
            key: 'id',
        },
    },
    created_by: {
        type: DataTypes.BIGINT.UNSIGNED,
    },
    updated_by: {
        type: DataTypes.BIGINT.UNSIGNED,
    },
}, {
    tableName: 'users',
    timestamps: true,
    createdAt: 'created_at',
    updatedAt: 'updated_at',
});

Users.addHook('beforeCreate', (record, options) => {
    if (options.user) {
        record.created_by = options.user.id;
        record.updated_by = options.user.id;
    } else {
        throw new Error('User not provided in options');
    }
});

Users.addHook('beforeUpdate', (record, options) => {
    if (options.user) {
        record.updated_by = options.user.id;
    } else {
        throw new Error('User not provided in options');
    }
});

Users.associate = (model) => {
    Users.belongsTo(model.Roles, { foreignKey: 'role_id', as: 'role' });
    Users.belongsTo(model.Address, { foreignKey: 'address_id', as: 'address' });
    
    Users.hasOne(model.Organizations, { foreignKey: 'owner_id', as: 'organization' });
    Users.hasMany(model.Organizations, { foreignKey: 'created_by', as: 'createdOrganizations' });
    Users.hasMany(model.Organizations, { foreignKey: 'updated_by', as: 'updatedOrganizations' });

    Users.hasMany(model.Buildings, { foreignKey: 'created_by', as: 'createdBuildings' });
    Users.hasMany(model.Buildings, { foreignKey: 'updated_by', as: 'updatedBuildings' });

    Users.hasMany(model.BuildingLevels, { foreignKey: 'created_by', as: 'createdLevels' });
    Users.hasMany(model.BuildingLevels, { foreignKey: 'updated_by', as: 'updatedLevels' });

    Users.hasMany(model.BuildingUnits, { foreignKey: 'created_by', as: 'createdUnits' });
    Users.hasMany(model.BuildingUnits, { foreignKey: 'updated_by', as: 'updatedUnits' });

    Users.hasMany(model.UserBuildingUnits, { foreignKey: 'user_id', as: 'userUnits' });
    Users.hasMany(model.UserBuildingUnits, { foreignKey: 'created_by', as: 'createdUserUnits' });
    Users.hasMany(model.UserBuildingUnits, { foreignKey: 'updated_by', as: 'updatedUserUnits' });

    Users.hasMany(model.UserPermissions, { foreignKey: 'user_id', as: 'userPermissions' });
    Users.hasMany(model.UserPermissions, { foreignKey: 'granted_by', as: 'grantedUserPermissions' });
    Users.hasMany(model.RolePermissions, { foreignKey: 'granted_by', as: 'grantedRolePermissions' });

    Users.hasMany(model.Favorites, { foreignKey: 'user_id', as: 'favorites' });
    
    Users.hasMany(model.Departments, { foreignKey: 'created_by', as: 'createdDepartments' });
    Users.hasMany(model.Departments, { foreignKey: 'updated_by', as: 'updatedDepartments' });
    
    Users.hasOne(model.StaffMembers, { foreignKey: 'user_id', as: 'staffMember' });
    Users.hasMany(model.StaffMembers, { foreignKey: 'created_by', as: 'createdStaffMembers' });
    Users.hasMany(model.StaffMembers, { foreignKey: 'updated_by', as: 'updatedStaffMembers' });
    
    Users.hasMany(model.Queries, { foreignKey: 'user_id', as: 'queries' });
};

module.exports = Users;

