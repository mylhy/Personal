<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2017/11/21
  Time: 19:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>显示</title>
    <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
</head>
<body>
<h2>图书显示详情</h2>
<a href="${pageContext.request.contextPath}/books/toAddBooks">添加图书</a>
<table id="tab" border="1">
    <tr>
        <td>编号</td>
        <td>图书名称</td>
        <td>图书类型</td>
        <td>图书作者</td>
        <td>图书价格</td>
        <td>出版社</td>
        <td>出版日期</td>
        <td>图书状态</td>
        <td>备注</td>
        <td>操作</td>
    </tr>
</table>
</body>
<script>
    /*初始化加载数据*/
    function loadData(num) {
        $("#tab tr:not(:first)").remove();
        $.post("${pageContext.request.contextPath}/books/pageBooksList", "cpage=" + num, function (data) {
            var cpage = data.cpage;//当前页
            var allPage = data.allPage//尾页
            if (data.res == '') {
                var tr = "<tr><td colspan='11' align='center' style='color:red;'>没有数据</td></tr>";
                $("#tab").append(tr);
            }
            $.each(data.res, function (i, v) {
                var td = "<tr>";
                td += "<td>" + v[0].bid + "</td>"
                td += "<td>" + v[0].bname + "</td>";
                td += "<td>" + v[0].btype.tname + "</td>";
                td += "<td>" + v[0].bauthor + "</td>";
                td += "<td>" + v[0].bprice + "</td>";
                td += "<td>" + v[0].bpress + "</td>";
                var time = new Date(v[0].bpdate)
                td += "<td>" + time.getFullYear() + "-" + (time.getMonth() + 1) + "-" + time.getDate() + "</td>";

                td += "<td>" + v[0].bstate + "</td>";
                td += "<td>" + v[0].bremarks + "</td>";
                td += "<td>" +
                    "<input type='button' onclick='toUpdate("+v[0].bno+")' value='修改' > " +
                    "</td>";
                td += "</tr>";
                $("#tab").append(td);
            });

            var tr = "<tr><td colspan='11' align='center'>"
            tr += "<button onclick='loadData(1)'>首页</button>&nbsp;";
            tr += "<button onclick='loadData(" + (cpage - 1 > 0 ? cpage - 1 : 1) + ")'>上一页</button>";
            tr += cpage + "/" + allPage;
            tr += "<button onclick='loadData(" + (cpage + 1 > allPage ? allPage : cpage + 1) + ")'>下一页</button>";
            tr += "<button onclick='loadData(" + allPage + ")'>尾页</button>";
            tr += "共有" + data.allNum + "条数据";
            tr += "</td></tr>";
            $("#tab").append(tr);
        });
    }
    function  toUpdate(id) {
        window.location.href="${pageContext.request.contextPath}/books/toUpdateBooks?bno="+id;
    }

    window.onload = loadData(1);
</script>
</html>
