const jwtSecretKey = 'hello  MLZ ^_^';
const expiresIn = '10h' //expiresIn: 60 * 60,//按秒

module.exports = { //配置文件，写密钥和时间
  jwtSecretKey,
  expiresIn,
}