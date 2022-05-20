## API文档
1.POST /server/getToken  
Content-Type: application/x-www-form-urlencoded  
字段：username=0121903490218&password=123456&type=0
返回值："result": "ok","token":xxxx

2.POST /server/checkUserToken  
authorization: Bearer  xxx  
返回值：1通过/0error

3.POST /server/student/student   
authorization: Bearer   
Content-Type: application/x-www-form-urlencoded  
字段：id=1  
返回值：0 or
```
{
    "id": "28987477",
    "studentName": "孟令哲",
    "studentSchool": "管理学院",
    "studentNumber": "0121903490218",
    "studentClass": "信管1906",
    "studentTel": "13485311619"
}
```

4.POST /server/student/updateStudent   
authorization: Bearer xxxx  
Content-Type: application/x-www-form-urlencoded  
字段：  
id:28987477  
studentName:xxx 
studentSchool:管理学院  
studentNumber:0121xxxxx
studentClass:信管1906  
studentTel:134853xxxxx 
返回值：0/1

5.POST /server/record/page   
authorization: Bearer xxx  
Content-Type: application/x-www-form-urlencoded  
字段：page=1&length=5  
返回值：
```
数组：
[
    {
        "sdate": "2020-08-01T16:00:00.000Z",
        "starttime": "14:00:00",
        "endtime": "16:00:00",
        "state": 2,
        "student": "",
        "classroom": ""
    },
```