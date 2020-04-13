// Project.js
var express = require('express')
var router = express.Router()
const jwt = require('jsonwebtoken')
const SECRET_KEY = require('../config/config').SECRET_KEY

router.get('/getProjects', function (req, res) {
  // console.log('test')
  // let sql = `SELECT proposal.user_id                 AS userid, 
  //               projects.projects_id             AS projects_id, 
  //               projects.projects_name           AS projects_name, 
  //               memberdata.nickname              AS nickname, 
  //               project_class.project_class_name AS project_class_name, 
  //               project_use.use_name             AS use_name, 
  //               class.class_name                 AS class_name, 
  //               style.style_name                 AS style_name, 
  //               projects.release_time            AS release_time, 
  //               projects.end_time                AS end_time 
  //           FROM   ((((((memberdata 
  //                    JOIN proposal 
  //                      ON(( memberdata.userid = proposal.user_id ))) 
  //                   JOIN projects 
  //                     ON(( proposal.proposal_id = projects.proposal_id ))) 
  //                  JOIN project_class 
  //                    ON(( projects.project_class_id = project_class.project_class_id ))) 
  //                 JOIN style 
  //                   ON(( projects.style_id = style.style_id ))) 
  //                JOIN project_use 
  //                  ON(( projects.use_id = project_use.project_use_id ))) 
  //               JOIN class 
  //                 ON(( projects.class_id = class.class_id ))) `
  let sql = `rsGetProposalList`
  req.query(sql, 0, function (error, results, fields) {

    if (error) {
      console.log(error)
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
      console.log(error)
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

console.log('Project載入完成')
//---
module.exports = router