const { Sequelize } = require('sequelize');

const sequelize = new Sequelize(process.env.DB_NAME, process.env.DB_USER, process.env.DB_PASSWORD, {
    host: process.env.DB_HOST,
    dialect: 'mysql',
    logging: false,
});

sequelize.authenticate()
    .then(() => {
        console.log('Connected to MySQL with Sequelize');
    })
    .catch(err => {
        console.error('Unable to connect to the database:1', err);
    });

module.exports = sequelize;
