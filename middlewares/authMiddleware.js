const { verifyToken } = require('../utils/jwt');
const Users = require('../models/Users');

const authMiddleware = async (req, res, next) => {
    try {
        const token = req.headers?.authorization?.split(' ')[1];
        if (!token) return res.status(401).json({ message: 'Authorization required' });
        
        const { user } = verifyToken(token);
        if (!user?.id || !user.role_id) return res.status(403).json({ message: 'Invalid or malformed token' });
        
        const verifyUser = await Users.findOne({ where: { id: user.id, role_id: user.role_id, status: 1 } });
        if (!verifyUser) return res.status(403).json({ message: 'User account is deactivated or deleted by administrator' });
        
        req.user = { id: user.id, role_id: user.role_id };
        next();
    } catch (error) {
        console.error("Auth Error:", error.message);
        res.status(403).json({ message: 'Invalid or expired token' });
    }
};


module.exports = authMiddleware;

