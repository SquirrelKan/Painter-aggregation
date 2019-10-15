// auth.js
'use strict';

var debug = require("debug")("debug:auth");
var express = require('express')
var router = express.Router()
const jwt = require('jsonwebtoken')
const SECRET_KEY = require('../config/config').SECRET_KEY

router.get('/getUserInfo', function (req, res, next) {
  if (!req.headers.authorization) {
    return res.send({
      status: '0005',
      message: 'No credentials sent!'
    })
  }
  if (req.headers.authorization.split(' ')[0] !== 'Bearer') {
    return res.status(403).json({
      status: '0006',
      message: 'No Bearer token content'
    });
  }
  const token = req.headers.authorization.split(' ')[1];
  jwt.verify(token, SECRET_KEY, (err, decoded) => {
    if (err) {
      // 401 Unauthorized -- 'Incorrect token'
      return res.status(401).json({
        status: '0005',
        message: 'Incorrect token'
      })
    }
    // req.username = decoded.username;
    req.username = decoded.username;
    // debug(decoded.userInfo)
    return res.send({
      status: '0000',
      message: 'getuserinfo token',
      userInfo: decoded.userInfo
    })
    // next();
  })
})

router.post('/getUserInfo', function (req, res) {
  let todo = [req.body.username]
  let sql = 'rsGetUserInfo'
  req.query(sql, todo, function (error, results, fields) {
    if (error) {
      debug(error)
      throw error
    }
    if (results.length !== 0) {
      return res.send({
        status: '0001',
        message: 'getUserinfo 存在'
      })
    }
    return res.send({
      status: '0000',
      message: 'getUserinfo 不存在'
    })
  })
  // debug(sql)
  // debug(decoded.userInfo)

  // next();
  // })
})

router.post('/login', function (req, res) {
  let todo = [
    req.body.account,
    req.body.password
  ]
  debug(req.body)
  let sql = 'rsGetLoginData'
  // debug(sql)
  req.query(sql, todo, function (error, results, fields) {
    if (error) {
      debug(error)
      throw error
    }
    if (results[0].length == 0) {
      debug(req.body.account + ' login error')
      return res.send({
        status: '0001',
        message: 'login error'
      })
    }
    // data= {data}
    // debug(results[0])
    let userinfo = JSON.parse(JSON.stringify(results[0][0]))

    // debug(userinfo)
    const claims = jwt.sign({
      userInfo: userinfo
    }, SECRET_KEY, {
      expiresIn: 60 * 60 * 1
    })
    debug(req.body.account + ' login success')
    return res.send({
      status: '0000',
      claims: claims,
      message: 'login success',
      data: userinfo
    })
  })
})

router.post('/register', function (req, res) {
  let todo = [
    req.body.nickname,
    req.body.account,
    req.body.email,
    req.body.password,
    req.body.identity
  ]
  // debug(true)
  let sql = 'rsRegister'
  // debug(req.body)
  debug(sql)
  req.query(sql, todo, function (error, results, fields) {
    if (error) {
      debug(error)
      throw error
    }
    if (results.length == 0) {
      debug(req.body.account + ' register error')
      return res.send({
        status: '0001',
        message: 'register error'
      })
    }
    debug(req.body.account + ' register success')
    let userinfo = {
      account: req.body.account,
      nickname: req.body.nickname,
      identity: req.body.identity_name === 2 ? ('paint') : (req.body.identity_name === 1 ? ('admin') : ('p'))
    }
    const claims = jwt.sign({
      userInfo: userinfo
    }, SECRET_KEY, {
      expiresIn: 60 * 60 * 24
    })
    return res.send({
      status: '0000',
      message: 'register list',
      claims: claims,
      data: {
        login: results
      }
    })
  })
})


debug('auth驗證載入完成')
//---
module.exports = router