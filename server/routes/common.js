// common.js
'use strict';

var moment = require('moment')
var debug = require("debug")(`[${moment().format('YYYY-MM-DD HH:mm:ss')}]debug:common`);
var express = require('express')
var router = express.Router()

router.get('/getGenre', function (req, res) {
    let id = !req.body.id || req.body.id === '' ? 0 : req.body.id;
    let sql = "rsGetGenre"
    debug(sql);
    req.query(sql, id, function (error, results, fields) {
        if (error) {
            debug(error)
            return res.status(400).send()
        }
        // debug(results)
        return res.send({
            status: '0000',
            message: 'get paintdata',
            data: {
                greneData: results[0]
            }
        })
    })
})

router.get('/getStyle', function (req, res) {
    id = !req.body.id || req.body.id === '' ? 0 : req.body.id;
    let sql = 'rsGetStyle'
    debug(sql);
    req.query(sql, id, function (error, results, fields) {
        if (error) {
            debug(error)
            return res.status(400).send()
        }
        return res.send({
            status: '0000',
            message: 'get paintdata',
            data: {
                genre: results[0]
            }
        })
    })
})

debug('common load end')

module.exports = router