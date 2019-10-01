//
var mysql = require("mysql")
var pool = mysql.createPool({
    host: 'localhost',
    user: 'maple',
    password: 'aicdfida',
    database: 'member',
    connectionLimit : 10,
})

var query = function(sql, options, callback) {
    // console.log(sql, options ,callback)
    if (typeof options === "function") {
        callback = options
        options = undefined
    }
    pool.getConnection(function(err,conn){
        if (err){
           callback(err,null,null) 
        } else {
            conn.query(sql, options, function(err,results,fields){
                // callback
                callback(err,results,fields)
            })
            conn.release()
        }
    })
}

console.log('sqlpool載入完成')
module.exports = query