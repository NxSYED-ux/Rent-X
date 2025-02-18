const { DataTypes } = require('sequelize');
const sequelize = require('../config/db');
const Organizations = require('./Organizations');
const Users = require('./Users');

const Departments = sequelize.define("Department", {
    id: {
        type: DataTypes.INTEGER.UNSIGNED,
        autoIncrement: true,
        primaryKey: true
    },
    name: {
        type: DataTypes.STRING(50),
        allowNull: false
    },
    description: {
        type: DataTypes.TEXT,
        allowNull: false
    },
    organization_id: {
        type: DataTypes.BIGINT.UNSIGNED,
        allowNull: false,
        references: {
            model: Organizations,
            key: "id"
        }
    },
    created_by: {
        type: DataTypes.BIGINT.UNSIGNED,
        allowNull: true,
        references: {
            model: Users,
            key: "id"
        }
    },
    updated_by: {
        type: DataTypes.BIGINT.UNSIGNED,
        allowNull: true,
        references: {
            model: Users,
            key: "id"
        }
    },
    created_at: {
        type: DataTypes.DATE,
        allowNull: false,
        defaultValue: DataTypes.NOW
    },
    updated_at: {
        type: DataTypes.DATE,
        allowNull: true,
        defaultValue: DataTypes.NOW
    }
}, {
    tableName: "departments",
    timestamps: true,
    createdAt: "created_at",
    updatedAt: "updated_at"
});

Departments.addHook('beforeCreate', (record, options) => {
    if (options.user) {
        record.created_by = options.user.id;
        record.updated_by = options.user.id;
    } else {
        throw new Error('User not provided in options');
    }
});

Departments.addHook('beforeUpdate', (record, options) => {
    if (options.user) {
        record.updated_by = options.user.id;
    } else {
        throw new Error('User not provided in options');
    }
});

Departments.associate = (model) => {
    Departments.belongsTo(model.Users, { foreignKey: "created_by", as: "creator" });
    Departments.belongsTo(model.Users, { foreignKey: "updated_by", as: "updater" });
    Departments.belongsTo(model.Organizations, { foreignKey: "organization_id", as: 'organization'});
    
    Departments.hasMany(model.StaffMembers, { foreignKey: 'department_id', as: 'staffMembers' });
};


module.exports = Departments;
