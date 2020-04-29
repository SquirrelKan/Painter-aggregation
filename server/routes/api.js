var express = require('express')
var router = express.Router()

router.post('/account', function (req, res) {

})

router.get('/getPaint', function (req, res) {
  // body...
  let sql = `rsGetPaint`
  // console.log(sql)
  req.query(sql, function (error, results, fields) {
    if (error) {
      console.log(error)
      return res.status(400).send()
    }
    return res.status(200).send({
      message: 'get paintdata',
      data: {
        paints: results[0]
      }
    })
  })
})

router.get('/getStyle', function (req, res) {
  // body...
  let sql = `rsGetStyle`
  // console.log(sql)
  req.query(sql, 0, function (error, results, fields) {
    if (error) {
      console.log(error)
    }
    return res.send({
      status: '0000',
      message: 'get style',
      data: {
        StyleDate: results[0]
      }
    })
  })
})

router.post('/getUserInfo', function (req, res) {
  let userData = {
    username: req.body.username
  }
  let sql = `rsGetUserInfo`
  console.log(sql)
  req.query(sql, userData.username, function (error, results, fields) {
    if (error) {
      console.log(error)
    }
    if (results[0].length === 0) {
      return res.send({
        status: '0001',
        message: 'get error',
      })
    }
    return res.send({
      status: '0000',
      message: 'get list',
      data: {
        userInfo: results[0]
      }
    })

  })
})

router.post('/gettest', function (req, res) {
  // console.log(req.body)
  let userData = {
    nickname: req.body.nickname
  }
  let sql = `rsGettest`
  console.log(userData.nickname)
  req.query(sql, userData.nickname, function (error, results, fields) {
    if (error) {
      console.log(error)
    }
    if (results[0].length === 0) {
      return res.send({
        status: '0001',
        message: 'get error',
      })
    }
    return res.send({
      status: '0000',
      message: 'get list',
      data: {
        user: results[0]
      }
    })

  })
})

router.get('/api/user', function (req, res) {
  req.session.user = null
  res.json({
    message: '登出成功'
  })
})

console.log('api套件載入完成')
module.exports = router