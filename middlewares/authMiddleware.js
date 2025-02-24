const { verifyToken } = require('../utils/jwt');

const authMiddleware = (options = { tokenSource: 'header' }) => (req, res, next) => {
    let token;

    if (options.tokenSource === 'header') {
        token = req.headers.authorization?.split(' ')[1];
    } else if (options.tokenSource === 'cookie') {
        token = req.cookies?.token;
    }

    if (!token) {
        return res.status(401).json({ message: 'Authorization required' });
    }

    try {
        const decoded = verifyToken(token);

        if (!decoded || !decoded.user.id) {
            return res.status(403).json({ message: 'Invalid or malformed token' });
        }
        req.user = { id: decoded.user.id, role_id: decoded.user.role_id };
        console.log(req.user);
        next();
    } catch (error) {
        console.log(error.message)
        res.status(403).json({ message: 'Invalid or expired token' });
    }
};

module.exports = authMiddleware;

