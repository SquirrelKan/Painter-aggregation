'use strict';

var express = require('express');
const message = require('../message');
const requestStatusCodes = require('../requestStatusCodes');
var router = express.Router();

router.get('/', function (req, res) {
    res.status(200).send(
        message(requestStatusCodes.success, "hello world")
    );
});

module.exports = router;