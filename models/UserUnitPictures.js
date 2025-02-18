const { DataTypes } = require('sequelize');
const sequelize = require('../config/db');
const UserBuildingUnits = require('./UserBuildingUnits');

const UserUnitPictures = sequelize.define('UserUnitPictures', {
    id: {
        type: DataTypes.BIGINT.UNSIGNED,
        autoIncrement: true,
        primaryKey: true,
    },
    user_unit_id: {
        type: DataTypes.BIGINT.UNSIGNED,
        allowNull: false,
        references: {
            model: UserBuildingUnits,
            key: 'id',
        },
    },
    file_path: {
        type: DataTypes.STRING(255),
    },
    file_name: {
        type: DataTypes.STRING(255),
        unique: true,
    },
}, {
    tableName: 'userunitpictures',
    timestamps: true,
    createdAt: 'created_at',
    updatedAt: 'updated_at',
});

UserUnitPictures.associate = (model) => {
    UserUnitPictures.belongsTo(model.UserBuildingUnits, { foreignKey: 'user_unit_id', as: 'userUnit' });
};

module.exports = UserUnitPictures;
