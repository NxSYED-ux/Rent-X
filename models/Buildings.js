const { DataTypes } = require('sequelize');
const sequelize = require('../config/db');
const Organizations = require('./Organizations');
const Address = require('./Address');
const Users = require('./Users');

const Buildings = sequelize.define('Buildings', {
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
  name: {
    type: DataTypes.STRING(100),
    allowNull: false,
    unique: true,
    validate: {
      notEmpty: { msg: "Building name cannot be empty" },
    }
  },
  address_id: {
    type: DataTypes.BIGINT.UNSIGNED,
    allowNull: false,
    references: {
      model: Address,
      key: 'id',
    },
  },
  building_type: {
    type: DataTypes.STRING(50),
    allowNull: false,
  },
  construction_year: {
    type: DataTypes.INTEGER(4),
    allowNull: false,
  },
  status: {
    type: DataTypes.STRING,
    allowNull: false,
    validate: {
      isIn: {
        args: [['Approved', 'Under Review', 'Rejected', 'Under Processing', 'For Reapproval']],
      },
    },
  },
  area: {
    type: DataTypes.DECIMAL(10, 2),
    allowNull: false,
  },
  remarks: {
    type: DataTypes.TEXT,
  },
  created_by: {
    type: DataTypes.BIGINT.UNSIGNED,
    references: {
      model: Users,
      key: 'id',
    },
  },
  updated_by: {
    type: DataTypes.BIGINT.UNSIGNED,
    references: {
      model: Users,
      key: 'id',
    },
  },
}, {
  tableName: 'buildings',
  timestamps: true,
  createdAt: 'created_at',
  updatedAt: 'updated_at',
});

Buildings.addHook('beforeCreate', (record, options) => {
  if (options.user) {
    record.created_by = options.user.id;
    record.updated_by = options.user.id;
  } else {
    throw new Error('User not provided in options');
  }
});

Buildings.addHook('beforeUpdate', (record, options) => {
  if (options.user) {
    record.updated_by = options.user.id;
  } else {
    throw new Error('User not provided in options');
  }
});

Buildings.associate = (model) => {
  Buildings.belongsTo(model.Organizations, { foreignKey: 'organization_id', as: 'organization' });
  Buildings.belongsTo(model.Address, { foreignKey: 'address_id', as: 'address' });
  Buildings.belongsTo(model.Users, { foreignKey: 'created_by', as: 'creator' });
  Buildings.belongsTo(model.Users, { foreignKey: 'updated_by', as: 'updater' });
  
  Buildings.hasMany(model.BuildingPictures, { foreignKey: 'building_id', as: 'pictures' });
  Buildings.hasMany(model.BuildingDocuments, { foreignKey: 'building_id', as: 'documents' });
  Buildings.hasMany(model.BuildingLevels, { foreignKey: 'building_id', as: 'levels' });
  Buildings.hasMany(model.BuildingUnits, { foreignKey: 'building_id', as: 'units' });
  Buildings.hasMany(model.StaffMembers, { foreignKey: 'building_id', as: 'staffMembers' });
  Buildings.hasMany(model.Queries, { foreignKey: 'building_id', as: 'queries' });
};

module.exports = Buildings;