// Project.js
'use strict';

var debug = require("debug")("debug:project");
var express = require('express')
var router = express.Router()
const jwt = require('jsonwebtoken')
const SECRET_KEY = require('../config/config').SECRET_KEY

router.get('/getProjects', function (req, res) {
  let sql = `rsGetProposalList`
  req.query(sql, 0, function (error, results, fields) {
    if (error) {
      debug(error)
      return res.status(400).send();
    }
    return res.send({
      status: '0000',
      message: 'get paintdata',
      data: {
        projects: results[0]
      }
    })
  })
})

router.post('/getProject', function (req, res) {
  let pid = req.body.pid;
  let sql = `rsGetProposalList`
  req.query(sql, pid, function (error, results, fields) {
    if (error) {
      debug(error)
      return res.status(400).send();
    }
    return res.send({
      status: '0000',
      message: 'get paintdata',
      data: {
        project: results[0][0]
      }
    })
  })
})

router.get('/:pid', function (req, res) {
  let pid = req.params.pid
  let sql = `rsGetProposalList`
  req.query(sql, pid, function (error, results, fields) {
    if (error) {
      debug(error)
      return res.status(400).send();
    }
    return res.send({
      status: '0000',
      message: 'get paintdata',
      data: {
        project: results[0][0]
      }
    })
  })
})

debug('Project載入完成')
//---
module.exports = router