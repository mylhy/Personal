<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2017/12/4
  Time: 20:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>修改图书</title>
    <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
</head>
<body>
<h2>修改图书信息</h2>
<form action="${pageContext.request.contextPath}/books/doUpdateBooks" method="post">
    <input type="hidden" name="bno" value="${book.bno}" >
    编号：<input type="text" name="bid" value="${book.bid}" /><br/>
    名称：<input type="text" name="bname" value="${book.bname}" /><br/>
    作者：<input type="text" name="bauthor" value="${book.bauthor}" ><br/>
    价格：<input type="number" name="bprice" value="${book.bprice}" ><br/>
    类型：
    <c:forEach var="o" items="${bookType}">
        <input type="checkbox" value="${o.tno}" name="btype.tno" >${o.tname}
    </c:forEach><br/>
    出版社：<input type="text" name="bpress" value="${book.bpress}" ><br/>
    出版日期：<input type="text" name="bpdate" value="${book.bpdate}" ><br/>
    图书备注：<textarea name="bremarks" id="bremarks" cols="30" rows="10"></textarea><br/>
    书本状态：<input type="radio" value="在架" name="bstate" >在架
            <input type="radio" value="借出" name="bstate" >借出
            <input type="radio" value="破损" name="bstate" >破损
            <input type="radio" value="下架" name="bstate" >下架
    <br/>
    <input type="submit" value="修改">
</form>

<a href="${pageContext.request.contextPath}/pages/showBooks.jsp">返回</a>

<script>
    /*为复选，和单选，还有文本域赋值*/
    $("input:checkbox[value=${book.btype.tno}]").attr('checked','true');
    $("input:radio[value='${book.bstate}']").attr('checked','true');
    $("#bremarks").val('${book.bremarks}');
</script>



</body>
</html>
