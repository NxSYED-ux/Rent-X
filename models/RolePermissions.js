const { DataTypes } = require('sequelize');
const sequelize = require('../config/db');
const Roles = require('./Roles');
const Permissions = require('./Permissions');
const Users = require('./Users');

const RolePermissions = sequelize.define('RolePermissions', {
    id: {
        type: DataTypes.INTEGER.UNSIGNED,
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
    permission_id: {
        type: DataTypes.INTEGER.UNSIGNED,
        allowNull: false,
        references: {
            model: Permissions,
            key: 'id',
        },
    },
    name: {
        type: DataTypes.STRING(255),
        allowNull: false,
    },
    status: {
        type: DataTypes.TINYINT,
        allowNull: false,
        defaultValue: 1,
    },
    granted_by: {
        type: DataTypes.BIGINT.UNSIGNED,
        allowNull: false,
        references: {
            model: Users,
            key: 'id',
        },
    },
    header: {
        type: DataTypes.STRING(50),
        allowNull: false,
    }
}, {
    tableName: 'rolePermissions',
    timestamps: true,
    createdAt: 'created_at',
    updatedAt: 'updated_at',
});

RolePermissions.addHook('beforeCreate', (record, options) => {
    if (options.user) {
        record.granted_by = options.user.id;
    } else {
        throw new Error('User not provided in options');
    }
});

RolePermissions.addHook('beforeUpdate', (record, options) => {
    if (options.user) {
        record.granted_by = options.user.id;
    } else {
        throw new Error('User not provided in options');
    }
});

RolePermissions.associate = (model) => {
    RolePermissions.belongsTo(model.Roles, { foreignKey: 'role_id', as: 'role' });
    RolePermissions.belongsTo(model.Permissions, { foreignKey: 'permission_id', as: 'permission' });
    RolePermissions.belongsTo(model.Users, { foreignKey: 'granted_by', as: 'grantedBy' });
};

module.exports = RolePermissions;
