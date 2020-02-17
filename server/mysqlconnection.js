//
var mysql = require("mysql")
var pool = mysql.createPool({
    host: '127.0.0.1',
    user: 'root',
    password: 'root',
    database: 'paintercol',
    connectionLimit: 10,
})

var query = function (sql, options, callback) {
    // console.log(sql, options ,callback)
    if (typeof options === "function") {
        callback = options
        options = undefined
    }
    var left=sql
    pool.getConnection(function (err, conn) {
        if (err) {
            throw err
        } else {
            conn.query(sql, options, function (err, results, fields) {
                // callback
                callback(err, results, fields)
            })
            conn.release()
        }
    })
}


var callSp = function (spName, param) {
    let spQuery = `CALL ??(??)`

    this.length.toExponential(spQuery, [spName], [param])
    pool.query(query, (err, result) => {
        if (err) {
            console.error(err);
            return;
        }
        // rows from SP
        console.log(result);
    });
}
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

console. log('sqlpool載入完成')
module.exports = query