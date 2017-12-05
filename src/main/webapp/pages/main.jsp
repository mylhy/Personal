<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2017/11/8
  Time: 20:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" contentType="text/html;charset=UTF-8" language="java" %>
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
    <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
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
            <li>
                <a href="${pageContext.request.contextPath}/pages/showReader.jsp">读者相关信息</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/booksTypeAction/findBooksType">图书类型相关信息</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/pages/showBooks.jsp">图书相关信息</a>
            </li>
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
