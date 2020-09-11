// accountmgt.js
'use strict';

var debug = require("debug")("debug:accountmgt");
var express = require('express')
var router = express.Router()
const jwt = require('jsonwebtoken');
const message = require("../message");
const requestStatusCodes = require("../requestStatusCodes");
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
    let todo = [decoded.userInfo.account]
    let sql = `rsGetAccount`
    // debug(sql)
    // req.connect()
    req.query(sql, todo, function (error, results, fields) {
      if (error) {
        debug(error)
        return res.status(401).json({
          status: '0005',
          message: 'Incorrect token'
        })
      }
      req.username = decoded.username;
      // debug(results)
      return res.send({
        status: '0000',
        message: 'getaccountinfo token',
        userInfo: results[0][0]
      })
    })
    // req.end()
    // debug('可以關閉')
  })
})

router.put('/accountInfo', function (req, res) {
  // debug(req.body)
  let updateInfo = req.body.updateInfo
  debug(updateInfo)
  let param =
    [
      updateInfo.account
      , updateInfo.realname
      , updateInfo.nickname
      , updateInfo.icon
      , updateInfo.email
      , updateInfo.cellphone
      , updateInfo.birthday
      , updateInfo.address
    ]


  let sql = `rsUpdateAccountInfo`
  req.query(sql, param, function (error, results, fields) {
    if (error) {
      debug()
      throw error
    }
    return res.send(
      message(requestStatusCodes.success, null)
    )
  })
})

module.exports = router