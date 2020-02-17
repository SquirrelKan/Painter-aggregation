var express = require('express')
var router = express.Router()

router.get('/getArtwork', function (req, res) {
    let sql = `rsGetArtwork()`
    req.query(sql, function (error, results, fields) {})
    console.log('test')
})


console.log('arkwork載入完成')

module.exports = router