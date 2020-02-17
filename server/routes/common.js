// common.js
var express = require('express')
var router = express.Router()

router.get('/getGenre', function (req, res) {
    id = req.body.id === undefined || req.body.id === '' ? 0 : req.body.id;
    let sql = `rsGetGenre('${id}')`
    console.log(sql);
    req.query(sql, function (error, results, fields) {
        if (error) {
            console.log(error)
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

router.get('/getStyle', function (req, res) {
    id = req.body.id === undefined || req.body.id === '' ? 0 : req.body.id;
    let sql = `rsGetStyle('${id}')`
    //console.log(sql);
    req.query(sql, function (error, results, fields) {
        if (error) {
            console.log(error)
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

console.log('common load end')

module.exports = router