const { DataTypes } = require("sequelize");
const sequelize = require("../config/db");
const Users = require("./Users");
const BuildingUnits = require("./BuildingUnits");
const Buildings = require("./Buildings");
const Departments = require("./Departments");
const StaffMembers = require("./StaffMembers");

const Queries = sequelize.define("Queries", {
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
    unit_id: {
        type: DataTypes.BIGINT.UNSIGNED,
        allowNull: false,
        references: {
            model: BuildingUnits,
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
    department_id: {
        type: DataTypes.INTEGER.UNSIGNED,
        allowNull: false,
        references: {
            model: Departments,
            key: "id"
        }
    },
    staff_member_id: {
        type: DataTypes.BIGINT.UNSIGNED,
        allowNull: false,
        references: {
            model: StaffMembers,
            key: "id"
        }
    },
    description: {
        type: DataTypes.TEXT,
        allowNull: true
    },
    status: {
        type: DataTypes.ENUM("Open", "In Progress", "Closed", "Rejected"),
        allowNull: false
    },
    expected_closure_date: {
        type: DataTypes.DATE,
        allowNull: true
    },
    remarks: {
        type: DataTypes.TEXT,
        allowNull: true
    },
    created_at: {
        type: DataTypes.DATE,
        allowNull: false,
        defaultValue: DataTypes.NOW
    },
    updated_at: {
        type: DataTypes.DATE,
        allowNull: false,
        defaultValue: DataTypes.NOW
    }
}, {
    tableName: "queries",
    timestamps: true,
    createdAt: "created_at",
    updatedAt: "updated_at"
});

Queries.associate = (model) => {
    Queries.belongsTo(model.Users, { foreignKey: "user_id", as: "user" });
    Queries.belongsTo(model.BuildingUnits, { foreignKey: "unit_id", as: "unit" });
    Queries.belongsTo(model.Buildings, { foreignKey: "building_id", as: "building" });
    Queries.belongsTo(model.Departments, { foreignKey: "department_id", as: "department" });
    Queries.belongsTo(model.StaffMembers, { foreignKey: "staff_member_id", as: "staffMember" });
    
    Queries.hasMany(model.QueryPictures,{ foreignKey: "query_id", as: "pictures" });
};

module.exports = Queries;
