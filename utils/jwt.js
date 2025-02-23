const jwt = require('jsonwebtoken');
const secret = process.env.JWT_SECRET_KEY;

const generateToken = (user) => {
    return jwt.sign({ user }, secret, { expiresIn: process.env.JWT_EXPIRES_IN });
};

const verifyToken = (token) => {
    return jwt.verify(token, secret);
};

module.exports = { generateToken, verifyToken};