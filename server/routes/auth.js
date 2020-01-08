// auth.js
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
    // console.log(decoded.userInfo)
    return res.send({
      status: '0000',
      message: 'getuserinfo token',
      userInfo: decoded.userInfo
    })
    // next();
  })
})

router.post('/getUserInfo', function (req, res) {
  let sql = `SELECT username FROM  memberdata WHERE username = '${req.body.username}'`
  req.query(sql, function (error, results, fields) {
    if (error) {
      console.log(error)
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
  // console.log(sql)
  // console.log(decoded.userInfo)

  // next();
  // })
})

router.post('/login', function (req, res) {
  let todo = {
    username: req.body.username,
    password: req.body.password
  }
  // console.log(req.body)
  let sql = `SELECT username,nickName, password, identity_name FROM  (memberdata JOIN identity ON ((memberdata.identityid = identity.identity_id))) WHERE username='${todo.username}' AND password='${todo.password}'`
  // console.log(sql)
  req.query(sql, function (error, results, fields) {
    if (error) {
      console.log(error)
      throw error
    }
    if (results.length == 0) {
      console.log(todo.username + ' login error')
      return res.send({
        status: '0001',
        message: 'login error'
      })
    }
    // data= {data}
    // console.log(data.data[0].user_name)

    let userinfo = {
      username: results[0].username,
      nickname: results[0].nickName,
      identity: results[0].identity_name
    }

    console.log(userinfo)
    const claims = jwt.sign({
      userInfo: userinfo
    }, SECRET_KEY, {
      expiresIn: 60 * 60 * 24
    })
    console.log(todo.account + ' login success')
    return res.send({
      status: '0000',
      claims: claims,
      message: 'login success',
      data: req.body
    })
  })
})

router.post('/register', function (req, res) {
  let todo = {
    nickName: req.body.nickName,
    username: req.body.username,
    email: req.body.email,
    password: req.body.password,
    identity: req.body.identity
  }
  // console.log(true)
  let sql = `INSERT INTO memberdata (username,nickname,email, password,identityid) VALUES ('${todo.username}','${todo.nickName}','${todo.email}', '${todo.password}',${todo.identity})`
  // console.log(req.body)
  console.log(sql)
  req.query(sql, function (error, results, fields) {
    if (error) {
      console.log(error)
      throw error
    }
    if (results.length == 0) {
      console.log(todo.accousernameunt + ' register error')
      return res.send({
        status: '0001',
        message: 'register error'
      })
    }
    console.log(todo.username + ' register success')
    let userinfo = {
      username: req.body.username,
      nickname: req.body.nickName,
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


console.log('auth驗證載入完成')
//---
module.exports = router