const { DataTypes } = require('sequelize');
const sequelize = require('../config/db');
const Address = require('./Address');
const Users = require('./Users')


const Organizations = sequelize.define('Organizations', {
    id: {
        type: DataTypes.BIGINT.UNSIGNED,
        autoIncrement: true,
        primaryKey: true,
    },
    name: {
        type: DataTypes.STRING(50),
        allowNull: false,
        unique: true,
    },
    status: {
        type: DataTypes.ENUM('Enable', 'Disable', 'Block'),
        allowNull: false,
    },
    address_id: {
        type: DataTypes.BIGINT.UNSIGNED,
        allowNull: false,
        references: {
            model: Address,
            key: 'id',
        },
    },
    owner_id: {
        type: DataTypes.BIGINT.UNSIGNED,
        allowNull: false,
        references: {
            model: Users,
            key: 'id',
        },
    },
    membership_start_date: {
        type: DataTypes.DATEONLY,
        allowNull: false,
    },
    membership_end_date: {
        type: DataTypes.DATEONLY,
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
    tableName: 'organizations',
    timestamps: true,
    createdAt: 'created_at',
    updatedAt: 'updated_at',
});

Organizations.addHook('beforeCreate', (record, options) => {
    if (options.user) {
        record.created_by = options.user.id;
        record.updated_by = options.user.id;
    } else {
        throw new Error('User not provided in options');
    }
});

Organizations.addHook('beforeUpdate', (record, options) => {
    if (options.user) {
        record.updated_by = options.user.id;
    } else {
        throw new Error('User not provided in options');
    }
});


Organizations.associate = (model) => {
    Organizations.belongsTo(model.Address, { foreignKey: 'address_id', as: 'address' });
    Organizations.belongsTo(model.Users, { foreignKey: 'owner_id', as: 'owner' });
    Organizations.belongsTo(model.Users, { foreignKey: 'created_by', as: 'creator' });
    Organizations.belongsTo(model.Users, { foreignKey: 'updated_by', as: 'updater' });
    
    Organizations.hasMany(model.OrganizationDocuments, { foreignKey: 'organization_id', as: 'documents' });
    Organizations.hasMany(model.OrganizationPictures, { foreignKey: 'organization_id', as: 'pictures' });
    Organizations.hasMany(model.Buildings, { foreignKey: 'organization_id', as: 'buildings' });
    Organizations.hasMany(model.BuildingUnits, { foreignKey: 'organization_id', as: 'units' });
    Organizations.hasMany(model.Departments, { foreignKey: 'organization_id', as: 'departments' });
    Organizations.hasMany(model.StaffMembers, { foreignKey: 'organization_id', as: 'staffMembers' });
};

module.exports = Organizations;

