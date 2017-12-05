<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2017/11/14
  Time: 8:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>图书类型</title>
    <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
</head>
<body>
<h2>图书类型</h2>
<a href="${pageContext.request.contextPath}/pages/addBookType.jsp">添加图书类型</a>
<table width="200" border="1">
    <tr>
        <td>编号</td>
        <td>类型名称</td>
        <td>操作</td>
    </tr>
    <c:forEach var="t" items="${findBooksType}" varStatus="ids">
        <tr>
            <td>${ids.count}</td>
            <td>${t.tname}</td>
            <td>
                <input type="button" onclick="toUpdate('${t.tno}','${t.tname}')" value="修改"/>
            </td>
        </tr>
    </c:forEach>
</table>
<!--修改框-->
<div id="updateDiv"
     style="width: 420px;height: 200px;border: #000000 1px solid;text-align: center;position: absolute;top:85px;left: 400px;background: #ffffff;display:none;">
    <div style="color:#ffffff;background:#000000;font-size: 22px;">图书类型修改<span style="float:right;margin-right:10px;"    onclick="hideUpdateDiv()">X</span></div>

</div>
<!--提示框-->
<div id="resDiv"
     style="width: 420px;height: 200px;border: #000000 1px solid;text-align: center;position: absolute;top:85px;left: 400px;background: #ffffff;display:none;">
    <div style="color:#ffffff;background:#000000;font-size: 22px;">消息提醒<span style="float:right;margin-right:10px;" onclick="hideResDiv()">X</span></div>
</div>
<script>

    /*修改框显示*/
    function showUpdateDiv() {
        $("#updateDiv").show(200);
    }
    function hideUpdateDiv() {
        $("#updateDiv").hide(200);
    }
    /*提示框显示*/
    function showResDiv() {
        $("#resDiv").show(200);
    }
    function hideResDiv() {
        $("#resDiv").hide(200);
        location = location;
    }
    function toUpdate(i, v) {
        $("#updateDiv :not(:lt(2))").remove();
        var te = '<form action="" id="updateFrm" method="post">';
        te += '<input type="hidden" value="' + i + '" name="tno">';
        te += '图书类型： <input type="text" value="' + v + '" name="tname"><br>';
        te += '<input type="button" onclick="doUpdate()" value="修改"';
        te += '</form>';
        $("#updateDiv").append(te);
        showUpdateDiv();
    }
    function doUpdate() {
        var param = $("#updateFrm").serialize();
        $.post("${pageContext.request.contextPath}/booksTypeAction/updateBooksType", param, function (data) {
            $("#resDiv :gt(1)").remove();//删除修改框里面的内容
            var res;
            if (data == '1') {
                res = "<p style='font-size: 32px;color: blue;'>修改成功</p>"
            } else {
                res = "<p style='font-size: 32px;color: red;'>修改失败</p>"
            }
            hideUpdateDiv();
            $("#resDiv").append(res);
            showResDiv();
        });
    }

</script>
</body>
</html>
