const { DataTypes } = require('sequelize');
const sequelize = require('../config/db');
const Organizations = require('./Organizations');

const OrganizationPictures = sequelize.define('OrganizationPictures', {
    id: {
        type: DataTypes.BIGINT.UNSIGNED,
        autoIncrement: true,
        primaryKey: true,
    },
    organization_id: {
        type: DataTypes.BIGINT.UNSIGNED,
        allowNull: false,
        references: {
            model: Organizations,
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
    tableName: 'organizationPictures',
    timestamps: true,
    createdAt: 'created_at',
    updatedAt: 'updated_at',
});

OrganizationPictures.associate = (model) => {
    OrganizationPictures.belongsTo(model.Organizations, { foreignKey: 'organization_id', as: 'organization' });
};

module.exports = OrganizationPictures;
