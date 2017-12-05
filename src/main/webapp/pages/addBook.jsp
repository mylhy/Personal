<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2017/11/15
  Time: 19:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>添加图书</title>
</head>
<body>
    <h2>添加图书</h2>
    <div style="color:${param.res==1?"blue":"red"};">
        ${param.res==1?'添加成功':param.res==2?'添加失败':''}
    </div>
    <form action="${pageContext.request.contextPath}/books/addBooks" method="post">
        编号：<input type="text" name="bid" /><br/>
        名称：<input type="text" name="bname" /><br/>
        作者：<input type="text" name="bauthor" ><br/>
        价格：<input type="number" name="bprice"><br/>
        类型：
        <c:forEach var="o" items="${booksType}">
            <input type="checkbox" value="${o.tno}" name="btype.tno" >${o.tname}
        </c:forEach><br/>
        出版社：<input type="text" name="bpress" ><br/>
        出版日期：<input type="text" name="bpdate"><br/>
        图书备注：<textarea name="bremarks" id="" cols="30" rows="10"></textarea><br/>
        书本状态：<input type="radio" value="在架" name="bstate" checked >在架
                <input type="radio" value="借出" name="bstate" >借出
                <input type="radio" value="破损" name="bstate" >破损
                <input type="radio" value="下架" name="bstate" >下架
                <br/>
        <input type="reset">
        <input type="submit" value="添加">
    </form>

    <a href="${pageContext.request.contextPath}/pages/main.jsp">返回</a>
</body>
</html>
