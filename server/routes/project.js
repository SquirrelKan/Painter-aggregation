// Project.js
'use strict';

var debug = require("debug")("debug:project");
var express = require('express')
var router = express.Router()
const jwt = require('jsonwebtoken');
const message = require("../message");
const requestStatusCodes = require("../requestStatusCodes");
const SECRET_KEY = require('../config/config').SECRET_KEY

router.get('/projects', function (req, res) {
  let sql = `rsGetProposalList`
  req.query(sql, 0, function (error, results, fields) {
    if (error) {
      debug(error)
      return res.status(400).send();
    }
    return res.send(
      message(requestStatusCodes.success, { projects: results[0] })
    )
  })
})

router.post('/project', function (req, res) {
  let pid = req.body.pid;
  let sql = `rsGetProposalList`
  req.query(sql, pid, function (error, results, fields) {
    if (error) {
      debug(error)
      return res.status(400).send(
        message(requestStatusCodes.error, null)
      );
    }
    if (results) {
      return res.send(
        message(requestStatusCodes.success, { project: results[0][0] })
      )
    }
  })
})

router.get('/:pid', function (req, res) {
  let pid = req.params.pid
  let sql = `rsGetProposalList`
  req.query(sql, pid, function (error, results, fields) {
    if (error) {
      debug(error)
      return res.status(400).send(
        message(requestStatusCodes.error, null)
      );
    }
    return res.send(
      message(requestStatusCodes.success, { project: results[0][0] })
    )
  })
})

debug('Project載入完成')
//---
module.exports = router