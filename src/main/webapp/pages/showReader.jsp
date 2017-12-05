<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2017/11/10
  Time: 9:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>读者管理</title>
    <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
</head>
<body>
<h2>读者管理</h2>

<a href="${pageContext.request.contextPath}/pages/addReader.jsp">添加读者</a>
<table border="1" width="800" id="tab">
    <tr>
        <td> 编号</td>
        <td> 姓名</td>
        <td> 性别</td>
        <td> 出生年月</td>
        <td> 身份证号</td>
        <td> 联系方式</td>
        <td> 所押金额</td>
        <td> 办证日期</td>
        <td> 状态</td>
        <td> 操作</td>
    </tr>
</table>
<p/>
<a href="${pageContext.request.contextPath}/pages/main.jsp">回到主页</a>
<!-- 修书用户信息框 -->
<div id="details" style="width: 420px;height: 420px;border: #000000 1px solid;text-align: center;position: absolute;top:50px;left: 400px;background: #ffffff;display:none;">
    <div style="color:#ffffff;background:#000000;font-size: 22px;">个人信息<span style="float:right;margin-right:10px;" onclick="hideDiv()">X</span></div>
<p/>
</div>

<!--提示框-->
<div id="resDiv" style="width: 420px;height: 200px;border: #000000 1px solid;text-align: center;position: absolute;top:85px;left: 400px;background: #ffffff;display:none;">
    <div style="color:#ffffff;background:#000000;font-size: 22px;">消息提醒<span style="float:right;margin-right:10px;" onclick="hideResDiv()">X</span></div>
    <p/>
</div>

<script>
    /*修改框显示*/
    function showDiv() {
        $("#details").show(200);
    }
    function hideDiv() {
        $("#details").hide(200);
    }
    /*提示框显示*/
    function showResDiv() {
        $("#resDiv").show(200);
    }
    function hideResDiv() {
        $("#resDiv").hide(200);
    }
    /*初始化加载数据*/
    function loadData(num) {
        $("#tab tr:not(:first)").remove();
        $.post("${pageContext.request.contextPath}/readerAction/findReaderList", "cpage=" + num, function (data) {
            var cpage = data.cpage;//当前页
            var allPage = data.allPage//尾页
            if (data.res == '') {
                var tr = "<tr><td colspan='10' align='center' style='color:red;'>没有数据</td></tr>";
                $("#tab").append(tr);
            }
            $.each(data.res, function (i, v) {
                var td = "<tr>";
                td += "<td>" + (i + 1) + "</td>";
                td += "<td>" + v.rname + "</td>";
                td += "<td>" + v.rsex + "</td>";
                var time = new Date(v.rbirthdate)
                td += "<td>" + time.getFullYear() + "-" + (time.getMonth() + 1) + "-" + time.getDate() + "</td>";
                td += "<td>" + v.rproofnum + "</td>";
                td += "<td>" + v.rtel + "</td>";
                td += "<td>" + v.rmoney + "</td>";
                var time = new Date(v.rintime)
                td += "<td>" + time.getFullYear() + "-" + (time.getMonth() + 1) + "-" + time.getDate() + "</td>";
                td += "<td>" + (v.rtype == 1 ? '正常' : v.rtype == 2 ? '注销' : '黑名单') + "</td>";
                td += "<td>" +
                    "<input type='button' onclick='toUpdate(" + JSON.stringify(v) + ","+cpage+")' value='修改' > " +
                    "</td>";
                td += "</tr>";
                $("#tab").append(td);
            });

            var tr = "<tr><td colspan='10' align='center'>"
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
    window.onload = loadData(1);
    /*加载修改数据*/
    function toUpdate(data,cpage) {
        $("#details :gt(1)").remove();//删除修改框里面的内容
        /*构建form*/
        var te = '<form method="post" action="" id="updateform">';
            te += '<input type="hidden" name="rno" value='+data.rno+' >';
            te += ' 姓名：<input type="text" name="rname" value='+data.rname+' ><br/>';
            te += '性别：<input type="radio" name="rsex" value="男" >男';
            te += '<input type="radio" name="rsex" value="女"}>女';
            te += '<br/>';
            var time = new Date(data.rbirthdate)
            te += '出生年月：<input type="text" name="rbirthdate" value='+time.getFullYear() + "-" + (time.getMonth() + 1) + "-" + time.getDate()+'><br/>';
            te += '身份证号：<input type="text" name="rproofnum" value='+data.rproofnum+'><br/>';
            te += '联系方式：<input type="text" name="rtel" value='+data.rtel+'><br/>';
            te += '所押金额：<input type="text" name="rmoney" value='+data.rmoney+'><br/>';
            var time = new Date(data.rintime)
            te += '办证日期：<input type="text" name="rintime" value='+time.getFullYear() + "-" + (time.getMonth() + 1) + "-" + time.getDate()+'><br/>';
            te += '状态:<input type="radio" name="rtype" value="1">正常';
            te += '<input type="radio" name="rtype" value="2">注销';
            te += '<input type="radio" name="rtype" value="3">黑名单<br/>';
            te += '<input type="button" onclick="doUpdate('+cpage+')" value="修改">';
            te += '</form>';
        $("#details").append(te);//添加到修改框中
        /*为radio赋值*/
        if(data.rsex=='男') {
            $("#details input:radio[name='rsex']").eq(0).attr("checked", "true");//索引值=0,1,2....
        }else {
            $("#details input:radio[name='rsex']").eq(1).attr("checked", "true");
        }
        $("#details input:radio[name='rtype']").eq(data.rtype-1).attr("checked", "true");
        showDiv();
    }

    /*处理修改*/
    function doUpdate(cpage){
        //序列化
        var param = $("#updateform").serialize();
        $.post("${pageContext.request.contextPath}/readerAction/updateReader", param, function (data) {
            $("#resDiv :gt(1)").remove();//删除修改框里面的内容
            var res;
            if(data=='1'){
                res="<p style='font-size: 32px;color: blue;'>修改成功</p>"
            }else{
                res="<p style='font-size: 32px;color: red;'>修改失败</p>"
            }
            hideDiv();
            $("#resDiv").append(res);
            showResDiv();
            loadData(cpage);
        });
    }
</script>

</body>
</html>
