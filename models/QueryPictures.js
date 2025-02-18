const { DataTypes } = require("sequelize");
const sequelize = require("../config/db");
const Queries = require("./Queries");

const QueryPictures = sequelize.define("QueryPictures", {
    id: {
        type: DataTypes.BIGINT.UNSIGNED,
        autoIncrement: true,
        primaryKey: true
    },
    query_id: {
        type: DataTypes.BIGINT.UNSIGNED,
        allowNull: false,
        references: {
            model: Queries,
            key: "id"
        }
    },
    file_path: {
        type: DataTypes.STRING(255),
        allowNull: true
    },
    file_name: {
        type: DataTypes.STRING(255),
        allowNull: true,
        unique: true
    },
}, {
    tableName: "querypictures",
    timestamps: true,
    createdAt: "created_at",
    updatedAt: "updated_at"
});

QueryPictures.associate = (model) => {
    QueryPictures.belongsTo(model.Queries, { foreignKey: "query_id", as: "query" });
}

module.exports = QueryPictures;
