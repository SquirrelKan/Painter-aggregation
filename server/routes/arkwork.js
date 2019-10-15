'use strict';

var debug = require("debug")("debug:arkwork");
var express = require('express')
var router = express.Router()

router.get('/getArtwork', function (req, res) {
    let sql = `rsGetArtwork`
    req.query(sql, function (error, results, fields) {
        if (error) {
            debug(error)
            return res.status(400).send();
        }
        return res.status(200).send({
            status: '0000',
            message: 'get Artwork',
            data: {
                projects: results[0]
            }
        })
    })
    debug('test')
})

debug('arkwork載入完成')

module.exports = router