const Address = require('./Address');
const Roles = require('./Roles');
const Users = require('./Users');
const Organizations = require('./Organizations');
const OrganizationDocuments = require('./OrganizationDocuments');
const OrganizationPictures = require('./OrganizationPictures');
const Buildings = require('./Buildings');
const BuildingDocuments = require('./BuildingDocuments');
const BuildingPictures = require('./BuildingPictures');
const BuildingLevels = require('./BuildingLevels');
const BuildingUnits = require('./BuildingUnits');
const UnitPictures = require('./UnitPictures');
const UserBuildingUnits = require('./UserBuildingUnits');
const UserUnitPictures = require('./UserUnitPictures');
const Permissions = require('./Permissions');
const RolePermissions = require('./RolePermissions');
const UserPermissions = require('./UserPermissions');
const Favorites = require('./Favorites');
const Departments = require('./Departments');
const StaffMembers = require('./StaffMembers');
const Queries = require('./Queries');
const QueryPictures = require('./QueryPictures');
const DropdownTypes = require('./DropdownTypes');
const DropdownValues = require('./DropdownValues');

const models = {
    Address,
    Roles,
    Users,
    Organizations,
    OrganizationDocuments,
    OrganizationPictures,
    Buildings,
    BuildingDocuments,
    BuildingPictures,
    BuildingLevels,
    BuildingUnits,
    UnitPictures,
    UserBuildingUnits,
    UserUnitPictures,
    Permissions,
    RolePermissions,
    UserPermissions,
    Favorites,
    Departments,
    StaffMembers,
    Queries,
    QueryPictures,
    DropdownTypes,
    DropdownValues,
};

Object.keys(models).forEach((modelName) => {
    if (models[modelName].associate) {
        models[modelName].associate(models);
    }
});

module.exports = { models };
