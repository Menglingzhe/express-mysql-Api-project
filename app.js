// 导入 express
const express = require('express')
// 创建服务器的实例对象
const app = express()
// const joi = require('hapi/joi') //表单验证包
const joi = require('@hapi/joi') //表单验证包
// 导入并配置 cors 中间件
const cors = require('cors')
app.use(cors())

app.use(express.urlencoded({
  extended: false //解析 application/x-www-form-urlencoded 格式的表单数据
}))

// // 托管静态资源文件
// app.use('/uploads', express.static('./uploads'))

// 一定要在路由之前，封装 res.cc 函数,配置解析 Token 的中间件
app.use((req, res, next) => {
  // status 默认值为 1，表示失败的情况
  res.cc = function (err, status = 1) {
    res.send({
      status,// err 的值，可能是一个错误对象，也可能是一个错误的描述字符串
      message: err instanceof Error ? err.message : err,
    })
  }
  next()
})

const expressJWT = require('express-jwt')
const config = require('./config.js')
console.log(config.jwtSecretKey)
app.use(
    expressJWT({
        algorithms: ["HS256"],
        secret: config.jwtSecretKey,
  }).unless({
    // path: [/^\/api/]//正则匹配法，所有api下都不需要token
    path: ["/server/getToken"], //除了这个地址，其他的URL都需要验证
  })
);

//路由部分：
const serverRouter = require('./router/server')
app.use('/server', serverRouter)




// 定义错误级别的中间件
app.use((err, req, res, next) => {
  // 验证失败导致的错误
  if (err instanceof joi.ValidationError) return res.cc(err)
  if (err.name === 'UnauthorizedError') return res.cc('身份认证失败！')
  res.cc(err)
})

var server = app.listen(8053, "localhost", function () {
  var host = server.address().address;
  var port = server.address().port;
  console.log("应用实例，访问地址为 http://%s:%s", host, port);
});
