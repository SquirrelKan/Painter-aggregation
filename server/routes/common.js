// common.js
'use strict';

var moment = require('moment')
var debug = require("debug")(`[${moment().format('YYYY-MM-DD HH:mm:ss')}]debug:common`);
var express = require('express')
var router = express.Router()
var requestStatusCodes = require('../requestStatusCodes')
var message = require('../message')
router.get('/genre', function (req, res) {
    let id = !req.body.id || req.body.id === '' ? 0 : req.body.id;
    let sql = "rsGetGenre"
    debug(sql);
    req.query(sql, id, function (error, results, fields) {
        if (error) {
            debug(error)
            return res.status(400).send()
        }
        // debug(results)
        else {
            return res.status(200).send(
                message(requestStatusCodes.success, results[0])
            )
        }
    })
})

router.get('/style', function (req, res) {
    let id = !req.body.id || req.body.id === '' ? 0 : req.body.id;
    let sql = 'rsGetStyle'
    debug(sql);
    req.query(sql, id, function (error, results, fields) {
        if (error) {
            debug(error)
            return res.status(400).send(
                message(requestStatusCodes.error, null)
            )
        }
        return res.send(
            message(requestStatusCodes.success, results[0])
        )
    })
})

debug('common load end')

module.exports = router