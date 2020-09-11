'use strict';

var debug = require("debug")("debug:api");
var express = require('express');
const message = require("../message");
const requestStatusCodes = require("../requestStatusCodes");
var router = express.Router()

router.get('/paint', function (req, res) {
  // body...
  let sql = `rsGetPaint`
  // debug(sql)
  req.query(sql, function (error, results, fields) {
    if (error) {
      debug(error)
      return res.status(400).send()
    }
    return res.status(200).send(
      message(requestStatusCodes.success, { paints: results[0] })
    )
  })
})
router.post('/getUserInfo', function (req, res) {
  let userData = {
    username: req.body.username
  }
  let sql = `rsGetUserInfo`
  debug(sql)
  req.query(sql, userData.username, function (error, results, fields) {
    if (error) {
      debug(error)
    }
    if (results[0].length === 0) {
      return res.send(

        message(requestStatusCodes.error, null)
      )
    }
    return res.send(
      message(requestStatusCodes.success, { userInfo: results[0] })
    )
  })
})

router.post('/gettest', function (req, res) {
  debug(req.body)
  let userData = {
    nickname: req.body.nickname
  }
  let sql = `rsGettest`
  debug(userData.nickname)
  try {
    req.query(sql, userData.nickname, function (error, results, fields) {
      if (error) {
        debug(error)
      }
      debug(results)
      if (!results)
        return res.send(
          message(requestStatusCodes.error)
        )
      if (results[0].length === 0) {
        return res.send({
          status: '0001',
          message: 'get error',
        })
      }
      return res.send(
        message(requestStatusCodes.success, { user: results[0] })
      )
    })
  } catch (error) {
    message(requestStatusCodes.error, null)
  }

})

router.get('/api/user', function (req, res) {
  req.session.user = null
  res.json({
    message: '登出成功'
  })
})

debug('api套件載入完成')
module.exports = router