// accountmgt.js
var express = require('express')
var router = express.Router()
const jwt = require('jsonwebtoken')
const SECRET_KEY = require('../config/config').SECRET_KEY

router.get('/getAccountInfo', function (req, res, next) {
  const token = req.headers.authorization.split(' ')[1]
  jwt.verify(token, SECRET_KEY, (err, decoded) => {
    if (err) {
      // 401 Unauthorized -- 'Incorrect token'
      return res.status(401).json({
        status: '0005',
        message: 'Incorrect token'
      })
    }
    let userInfo = decoded.userInfo
    let sql = `rsGetAccount('${userInfo.username}')`
    // console.log(sql)
    // req.connect()
    req.query(sql, function (error, results, fields) {
      if (error) {
        console.log(error)
        throw error
      }
      req.username = decoded.username;
      // console.log(results)
      return res.send({
        status: '0000',
        message: 'getaccountinfo token',
        userInfo: results[0][0]
      })
    })
    // req.end()
    // console.log('可以關閉')
  })
})

router.post('/updateAccountInfo', function (req, res) {
  console.log(req.body)
  let updateInfo = req.body.updateInfo
  let sql = `UPDATE memberdata SET 
  '${updateInfo.username}',
  '${updateInfo.realname}' , 
  '${updateInfo.nickname}' ,
  '${updateInfo.icon}',
  '${updateInfo.email}',
  '${updateInfo.phone}',
  '${updateInfo.birthday}',
  '${updateInfo.address}'
  `
sql=`rsUpdateAccountInfo('${updateInfo.username}','${updateInfo.realname}','${updateInfo.nickname}','${updateInfo.icon}','${updateInfo.email}','${updateInfo.cellphone}','${updateInfo.birthday}','${updateInfo.address}')`
  req.query(sql, function (error, results, fields) {
    if (error) {
      console.log()
      throw error
    }
    return res.send({
      status: '0000',
      message: 'update success',
      // data: {
      //   login: results
      // }
    })
  })
  console.log(sql)
})

module.exports = router