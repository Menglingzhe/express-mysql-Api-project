## 服务器挂载实验 

使用宝塔面板配置pm2插件辅助将本node项目上线  
首先服务器要安装mysql环境，将数据库文件导入服务器中  
导入时候踩坑了，服务器安装mysql时端口号改为了3607  
而默认是3606，导致出错  
pm2集成了node环境，所以不要自己安装，不然会引起版本错误  
pm2使用时需要手动配置PM2 配置文件（ecosystem.config.js  
详见：[PM2 配置文件（ecosystem.config.js 字段详细介绍）](https://juejin.cn/post/6926357629375610887)  

于服务器端口配置和环境配置  
查询端口号：  
mysql> show global variables like 'port';  
一定要在根目录下查询    
使用nginx进行转发，截取路由将其转发至本地xxx端口  
