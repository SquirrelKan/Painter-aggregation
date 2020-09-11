'use strict';

var debug = require("debug")("debug:arkwork");
var express = require('express');
const message = require("../message");
const requestStatusCodes = require("../requestStatusCodes");
var router = express.Router()

router.get('/getArtwork', function (req, res) {
    let sql = `rsGetArtwork`
    req.query(sql, function (error, results, fields) {
        if (error) {
            debug(error)
            return res.status(400).send();
        }
        return res.status(200).send(
            message(requestStatusCodes.success, { projects: results[0] })
        )
    })
})

debug('arkwork載入完成')

module.exports = router