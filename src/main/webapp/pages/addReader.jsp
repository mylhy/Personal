<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2017/11/9
  Time: 11:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加读者</title>
</head>
<body>
<h2>读者添加</h2>
<p style="color:${param.res==1?'blue':'red'};">
    ${param.res==1?'添加成功':param.res==2?'添加失败':''}
</p>
<form action="${pageContext.request.contextPath}/readerAction/addReader" method="post">
    用户姓名：<input type="text" name="rname"><br/>
    用户性别：<input type="radio" name="rsex" value="男" checked>男
             <input type="radio" name="rsex" value="女">女
    <br/>
    出生年月：<input type="text" name="rbirthdate"><br/>
    身份证号：<input type="text" name="rproofnum"><br/>
    联系方式：<input type="text" name="rtel"><br/>
    所押金额：<input type="text" name="rmoney"><br/>
    办证日期：<input type="date" name="rintime"><br/>
    <input type="reset" value="重置">
    <input type="submit" value="添加">
</form>

<a href="${pageContext.request.contextPath}/pages/main.jsp">回到主页</a>
</body>
</html>
