const jwt = require('jsonwebtoken');
const secret = process.env.JWT_SECRET_KEY;

const generateToken = (userId) => {
    return jwt.sign({ id: userId }, secret, { expiresIn: process.env.JWT_EXPIRES_IN });
};

const verifyToken = (token) => {
    return jwt.verify(token, secret);
};

module.exports = { generateToken, verifyToken};