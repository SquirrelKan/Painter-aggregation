var express = require('express');
var bodyParser = require('body-parser')
var app = express()
const api = require("./routes/api")
const common = require('./routes/common.js')
const authRoute = require("./routes/auth")
const accountmgtRoute = require("./routes/accountmgt")
const artwork = require("./routes/arkwork")
const project = require("./routes/project")
const jwt = require('jsonwebtoken');
const SECRET_KEY = require('./config/config').SECRET_KEY;
var mysqlPoolQuery = require("./db/mysqlconnection")

var index = require('./routes/index');

const verifyToken = (req, res, next) => {
    if (!req.headers.authorization) {
        return res.status(403).json({
            status: '0005',
            message: 'No credentials sent!'
        });
    }
    if (req.headers.authorization.split(' ')[0] !== 'Bearer') {
        return res.status(403).json({
            status: '0006',
            message: 'No Bearer token content'
        });
    }
    const token = req.headers.authorization.split(' ')[1];
    jwt.verify(token, SECRET_KEY, (err, decoded) => {
        if (err) {
            // 401 Unauthorized -- 'Incorrect token'
            return res.status(401).json({
                status: '0005',
                message: 'Incorrect token'
            })
        }
        req.username = decoded.username;
        next();
    });
}

app.use(function (req, res, next) {
    req.query = mysqlPoolQuery;
    next();
});

var cors = require('cors')
app.use(cors())
app.use(bodyParser.json())
app.use(bodyParser.urlencoded({
    extended: false
}))

// Set routers
try {
    app.use('/', index)
    app.use('/api/v1', api)
    app.use('/api/v1/common', common)
    app.use('/api/v1/auth', authRoute)
    app.use('/api/v1/accountmgt', accountmgtRoute)
    app.use('/api/v1/artwork', artwork)
    app.use('/api/v1/project', project)
} catch (error) {
    debug(error)
}

module.exports = app