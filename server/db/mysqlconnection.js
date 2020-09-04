//
var debug = require("debug")("debug:mysqlconnection");
var mysql = require("mysql")
var pool = mysql.createPool({
    host: '34.80.160.131',
    user: 'maple',
    password: 'aicdfida',
    database: 'paintercol',
    connectionLimit: 10,
    timezone: "08:00"
})

var query = function (spName, options, callback) {
    let spQuery = "CALL ??(?)"
    if (typeof options === "function") {
        callback = options
        options = undefined
        spQuery = "CALL ??()"
        pool.getConnection(function (err, conn) {
            if (err) {
                // throw err
                callback(err, null, null)
            } else {
                conn.query(spQuery, spName, function (err, results, fields) {
                    // callback
                    debug(this.sql)
                    callback(err, results, fields)
                })
                conn.release()
            }
        })
    } else {
        pool.getConnection(function (err, conn) {
            if (err) {
                // throw err
                callback(err, null, null)
            } else {
                conn.query(spQuery, [spName, options], function (err, results, fields) {
                    // callback
                    debug(this.sql)
                    callback(err, results, fields)
                })
                conn.release()
            }
        })
    }
}

debug('sqlpool載入完成')
module.exports = query