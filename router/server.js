const express = require('express')
const router = express.Router()

// 导入用户路由处理函数对应的模块
const server_handler = require('../router_handler/server')
router.get('/test', server_handler.test)

router.post('/getToken', server_handler.getToken)

router.post('/checkUserToken', server_handler.checkUserToken)

router.post('/student/student', server_handler.student)

router.post('/student/updateStudent', server_handler.updateStudent)

router.post('/record/page', server_handler.recordPage)

module.exports = router