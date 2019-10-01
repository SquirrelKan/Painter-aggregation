var express = require('express')
var router = express.Router()



router.post('/account' ,function(req, res) {
    
})

router.get('/getPaint' ,function (req, res) {
    // body...
    let sql=`SELECT nickname,icon,painter_id AS pid,userid,memberdata.joinDate AS joindate 
    FROM (memberdata JOIN painter ON ((memberdata.userid = painter.user_id)))`
    // console.log(sql)
    req.query(sql,function(error,results,fields){
      if(error){
        console.log(error)
      }
      return res.send({
        status: '0000',
        message: 'get paintdata',
        data: {
        paints: results
      }      
    })
  })
})

router.post('/getUserInfo',function(req,res) {
  let todo= {
    username: req.body.username
  }
  let sql=`SELECT username FROM memberdata WHERE username= '${todo.username}'`
  // console.log(sql)
  req.query(sql,function(error,results,fields){
    if(error){
      console.log(error)
    }
    if(results.length===0){
      return res.send({
      status: '0001',
      message: 'get error',
    })    
    }
    return res.send({
      status: '0000',
      message: 'get list',
      data: {
        userInfo: results
      }
    })  
    
  })
})


router.get('/api/user',function(req,res){
  req.session.user = null
  res.json({
    message: '登出成功'
  })
})

console.log('api套件載入完成')
module.exports=router