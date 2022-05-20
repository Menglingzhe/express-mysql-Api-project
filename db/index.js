const mysql = require('mysql')

const db = mysql.createPool({ //link数据库
  host: '127.0.0.1', // 数据库的 IP 地址
  user: 'root', // 登录数据库的账号
  password: 'admin123', // 登录数据库的密码
  database: 'schoolclass', // 指定要操作哪个数据库
})

module.exports = db
// module.exports = {
//   db
// }
