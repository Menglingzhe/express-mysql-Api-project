// 导入数据库操作模块
const db = require('../db/index')
// 导入生成 Token 的包
const jwt = require('jsonwebtoken')
// 导入全局的配置文件
const config = require('../config')

exports.getToken = (req, res) => {
  var user = {
    userid: req.body.username,
    password: req.body.password,
    type: req.body.type
  };
  
  const sqlStr = "SELECT id, stuName FROM student WHERE stuGrade = ? and password=?";
  
  db.query(sqlStr, [user.userid, user.password], (err, results) => {
    if (err) return console.log('@',results,err); // 查询数据失败
    //if (err) throw err;
  //console.log('@','The solution is: ', results[0].solution);
    if (results.length != 0 && user.type == 0) {
      res.json({
        result: "ok",
        token: jwt.sign({
          userid: user.userid,
          data: "=============",
        },
          config.jwtSecretKey,
          {
            expiresIn: 60 * 60,
          }
        ),
      });
      console.log("成功");
    } else {
      res.json({
        result: "error",
      });
      console.log("失败");
    }
  });
};
exports.checkUserToken = (req, res) => {
    console.log("tokencheck合格");
    res.send("1");
    // console.log(req.body.userid)
}
 
exports.student = (req, res) => {
  var state = {
    id: req.user.userid,//token内信息
    state: req.body.id,
  };
  if (state.state == 1) {

    const sqlStr =
      "SELECT stuNo, stuName, stuSchool, stuGrade, stuClass, tel FROM student WHERE stuGrade = ?";
    
    db.query(sqlStr, [state.id], (err, results) => {
      if (err) return console.log(err.message);
      if (results.length != 0) {
        res.json({
          id: results[0].stuNo,
          studentName: results[0].stuName,
          studentSchool: results[0].stuSchool,
          studentNumber: results[0].stuGrade,
          studentClass: results[0].stuClass,
          studentTel: results[0].tel,
        });
      } else {
        console.log("无用户", results);
        res.send("0");
      }
    });
  } else {
    res.send(500, {
      error: "state error...",
    });
  }
}

exports.updateStudent = (req, res) => {
      const user = {
        stuNo: req.body.id,
        stuName: req.body.studentName,
        stuSchool: req.body.studentSchool,
        stuGrade: req.body.studentNumber,
        stuClass: req.body.studentClass,
        tel: req.body.studentTel,
      };
      for (let i in user) {//空值验证（应该放到检验中间件）
        if (user[i] == undefined) {
          res.send("0");
          return;
        }
  }
  
  const sqlStr = "update student set stuName=?, stuSchool=?, stuGrade=?, stuClass=?, tel=? where stuNo=?";
  
      const modSqlParams = [
        user.stuName,
        user.stuSchool,
        user.stuGrade,
        user.stuClass,
        user.tel,
        req.body.id,
      ];
      db.query(sqlStr, modSqlParams, (err, results) => {
        if (err) return console.log(err.message);
        if (results.affectedRows === 1) {
          res.status(200).send("1"); //返回数字易出错
        } else {
          res.send("0");
        }
      });
}

exports.recordPage = (req, res) => {
  var record = {
    id: req.user.userid,
    page: req.body.page,
    length: req.body.length,
  };
  if (record.page * record.length <= 0) {
    res.send("0"); //返回数字易出错
  }

  const sqlStr = `SELECT sdate, starttime, endtime, state, student, classroom FROM lsrecord limit ${(record.page - 1) * record.length
    },${record.page * record.length}`;
  
  db.query(sqlStr, (err, results) => {
    if (err) return console.log(err.message);
    if (results.length != 0) {
      res.json(results);
    } else {
      res.send("0");//无用户
    }
  });
}

exports.test = (req, res) => {
  console.log("ttest");
  res.send("Gettest");
  // console.log(req.body.userid)
}