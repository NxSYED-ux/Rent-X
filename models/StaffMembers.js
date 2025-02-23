const { DataTypes } = require('sequelize');
const sequelize = require('../config/db');
const Users = require("./Users");
const Departments = require("./Departments");
const Buildings = require("./Buildings");
const Organizations = require("./Organizations");

const StaffMembers = sequelize.define("StaffMembers", {
    id: {
        type: DataTypes.BIGINT.UNSIGNED,
        autoIncrement: true,
        primaryKey: true
    },
    user_id: {
        type: DataTypes.BIGINT.UNSIGNED,
        allowNull: false,
        references: {
            model: Users,
            key: "id"
        }
    },
    department_id: {
        type: DataTypes.INTEGER.UNSIGNED,
        allowNull: false,
        references: {
            model: Departments,
            key: "id"
        }
    },
    building_id: {
        type: DataTypes.BIGINT.UNSIGNED,
        allowNull: false,
        references: {
            model: Buildings,
            key: "id"
        }
    },
    organization_id: {
        type: DataTypes.BIGINT.UNSIGNED,
        allowNull: false,
        references: {
            model: Organizations,
            key: "id"
        }
    },
    is_manager: {
        type: DataTypes.TINYINT,
        allowNull: false
    },
    salary: {
        type: DataTypes.DECIMAL(8,1),
        allowNull: true
    },
    active_load: {
        type: DataTypes.INTEGER.UNSIGNED,
        allowNull: false,
        defaultValue: 0
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
    }
}, {
    tableName: "staffMembers",
    timestamps: true,
    createdAt: "created_at",
    updatedAt: "updated_at"
});

StaffMembers.addHook('beforeCreate', (record, options) => {
    if (options.user) {
        record.created_by = options.user.id;
        record.updated_by = options.user.id;
    } else {
        throw new Error('User not provided in options');
    }
});

StaffMembers.addHook('beforeUpdate', (record, options) => {
    if (options.user) {
        record.updated_by = options.user.id;
    } else {
        throw new Error('User not provided in options');
    }
});

StaffMembers.associate = (model) => {
    StaffMembers.belongsTo(model.Users, { foreignKey: "user_id", as: 'staffMember' });
    StaffMembers.belongsTo(model.Departments, { foreignKey: "department_id", as: 'department' });
    StaffMembers.belongsTo(model.Buildings, { foreignKey: "building_id", as: 'building' });
    StaffMembers.belongsTo(model.Buildings, { foreignKey: "organization_id", as: 'organization' });
    StaffMembers.belongsTo(model.Users, { foreignKey: "created_by", as: "creator" });
    StaffMembers.belongsTo(model.Users, { foreignKey: "updated_by", as: "updater" });
    
    StaffMembers.hasMany(model.Queries, {foreignKey: "staff_member_id", as: 'queries' });
};

module.exports = StaffMembers;
