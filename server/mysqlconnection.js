//
var mysql = require("mysql")
var pool = mysql.createPool({
    host: '127.0.0.1',
    user: 'root',
    password: 'root',
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
                    callback(err, results, fields)
                })
                conn.release()
            }
        })
    } else {
        pool.getConnection(function (err, conn) {
            // console.log(sql, param)
            if (err) {
                // throw err
                callback(err, null, null)
            } else {
                conn.query(spQuery, [spName, options], function (err, results, fields) {
                    // callback
                    callback(err, results, fields)
                })
                conn.release()
            }
        })
    }
    // this.length.toExponential(spQuery, [sql], [param])
}

// var query = function (sql, options, callback) {
//     // console.log(sql, options ,callback)
//     if (typeof options === "function") {
//         callback = options
//         options = undefined
//     }
//     console.log(sql)
//     pool.getConnection(function (err, conn) {

//         if (err) {
//             throw err
//         } else {
//             conn.query(sql, options, function (err, results, fields) {
//                 // callback
//                 callback(err, results, fields)
//             })
//             conn.release()
//         }
//     })
// }

// var query = function (sql, param, options, callback) {
//     // console.log(sql, options ,callback)
//     if (typeof options === "function") {
//         callback = options
//         options = undefined
//     }
//     pool.getConnection(function (err, conn) {
//         if (err) {
//             callback(err, null, null)
//         } else {
//             conn.query(sql, options, function (err, results, fields) {
//                 // callback
//                 callback(err, results, fields)
//             })
//             conn.release()
//         }
//     })
// }

console.log('sqlpool載入完成')
module.exports = query