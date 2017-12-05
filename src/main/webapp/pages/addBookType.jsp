<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2017/11/10
  Time: 11:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加图书类型</title>
</head>
<body>
<h2>添加图书类型</h2>
<p style="color:${param.res==1?'blue':'red'};">
    ${param.res==1?'添加成功':param.res==2?'添加失败':param.res==2?'添加类型不能为空':''}
</p>
<form action="${pageContext.request.contextPath}/booksTypeAction/addBooksType" method="post">
    图书类型：<input type="text" name="tname">
    <input type="submit" value="添加">
</form>
</body>
</html>
