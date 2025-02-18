const { DataTypes } = require('sequelize');
const sequelize = require('../config/db');
const Users = require('./Users');
const Permissions = require('./Permission');

const UserPermissions = sequelize.define('UserPermissions', {
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
    permission_id: {
        type: DataTypes.INTEGER.UNSIGNED,
        allowNull: false,
        references: {
            model: Permissions,
            key: 'id',
        },
    },
    status: {
        type: DataTypes.TINYINT,
        allowNull: false,
    },
    granted_by: {
        type: DataTypes.BIGINT.UNSIGNED,
        allowNull: true,
        references: {
            model: Users,
            key: 'id',
        },
    },
}, {
    tableName: 'userPermissions',
    timestamps: true,
    createdAt: 'created_at',
    updatedAt: 'updated_at',
});

UserPermissions.addHook('beforeCreate', (record, options) => {
    if (options.user) {
        record.granted_by = options.user.id;
    } else {
        throw new Error('User not provided in options');
    }
});

UserPermissions.addHook('beforeUpdate', (record, options) => {
    if (options.user) {
        record.granted_by = options.user.id;
    } else {
        throw new Error('User not provided in options');
    }
});

UserPermissions.associate = (models) => {
    UserPermissions.belongsTo(models.Users, { foreignKey: 'user_id', as: 'user' });
    UserPermissions.belongsTo(models.Permission, { foreignKey: 'permission_id', as: 'permission' });
    UserPermissions.belongsTo(models.Users, { foreignKey: 'granted_by', as: 'grantedBy' });
};

module.exports = UserPermissions;
