const { DataTypes } = require('sequelize');
const sequelize = require('../config/db');
const Organizations = require('./Organizations');

const OrganizationDocuments = sequelize.define('OrganizationDocuments', {
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
    document_type: {
        type: DataTypes.STRING(50),
        allowNull: false,
    },
}, {
    tableName: 'organizationDocuments',
    timestamps: true,
    createdAt: 'created_at',
    updatedAt: 'updated_at',
});

OrganizationDocuments.associate = (model) => {
    OrganizationDocuments.belongsTo(model.Organizations, { foreignKey: 'organization_id', as: 'organization' });
};

module.exports = OrganizationDocuments;
