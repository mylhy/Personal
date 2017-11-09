<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2017/11/8
  Time: 20:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title> <style>
    body{
        margin:0;padding: 0;
    }
    #topDiv1{
        min-width: 1024px;
        height:30px;
        border: 1px red solid;
    }
    #topDiv2{
        min-width: 1024px;
        height: 28px;
        border: 1px blue solid;
    }
    #centerDiv{
        min-width: 1024px;
        float: none;
    }
    #leftDiv{
        width: 18%;
        min-width: 170px;
        height: 500px;
        float: left;
        border: 1px yellowgreen solid;
    }
    #rightDiv{
        width: 82%;
        min-width: 954px;
        height: 500px;
        border: 1px yellowgreen solid;
    }
</style>
</head>
<body>
<!--top start-->
<div id="topDiv1">
    lo
</div>
<div id="topDiv2">
    go
</div>
<!--top close-->
<div id="centerDiv">
    <!--left start-->
    <div id="leftDiv">
        <h4>用户管理</h4>
        <ul>
            <li>添加用户</li>
            <li>修改用户</li>
        </ul>



    </div>
    <!--left close-->

    <!--left start-->
    <div id="rightDiv">
        内容显示
    </div>
    <!--left close-->
</div>
</body>
</html>
