const express = require('express');
const fileUpload = require('express-fileupload');
const fs = require('fs');
const bodyParser = require('body-parser');
const cors = require('cors');
const cookieParser = require('cookie-parser');
const path = require('path');
require('dotenv').config();

const {models} = require('./models/index.js');
const authRoutes = require('./routes/authRoutes');
const userRoutes = require('./routes/userRoutes');
const staffRoutes = require('./routes/staffRoutes');

const app = express();

const tempDir = '/tmp/';
if (!fs.existsSync(tempDir)) {
    fs.mkdirSync(tempDir, { recursive: true });
}
app.use(fileUpload({
    useTempFiles: true,
    tempFileDir: tempDir,
}));

app.use(cors());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.use(cookieParser());

app.use('/uploads', express.static(path.join(__dirname, 'uploads')));
app.use('/auth', authRoutes);
app.use('/user',userRoutes);
app.use('/staff',staffRoutes);



module.exports = app;
