<%--
  Created by IntelliJ IDEA.
  User: taosh
  Date: 5/21/2019
  Time: 5:33 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>我的相册</title>
    <script type="text/javascript" src="${app}/js/jquery-1.4.2.js"></script>

    <script>
        $(function() {
            $(".st").click(function () {
                var url = $(this).attr("action");
                $.post(url, {}, function (result) {
                    if (result == 1)
                        alert("设置成功");
                })
            })
        })
    </script>

</head>
<body>
<div style="width: 100%; height: 100%; border: 2px solid red">
    <div style="width: 100%; height: 100px; border: 2px solid red; font-size: 70px; text-align: center">
        我的相册
    </div>
    <div style="width: 100%; border: 2px solid red">
        <c:forEach items="${sessionScope.pics}" var="s">
            <div style="float: left">
                <div>
                    <img style="width: 500px" src="${app}/pic/user/${sessionScope.user.userName}/${s}"/>
                </div>
                <div style="text-align: center">
                    <a class="st" style="width: 50px" href="javascript:void(0)" action="${app}/setmainpic.do?id=${sessionScope.user.id}&url=${s}">设为主图</a>
                    <a style="width: 50px" href="${app}/deletepic.do?id=${sessionScope.user.id}&url=${s}">删除照片</a>
                </div>
            </div>
        </c:forEach>
    </div>
    <div style="width: 100%; height: 90px; border: 2px solid red">

            <form method="post" action="${app}/addphoto.do?method=add" enctype="multipart/form-data">
            <table style="border: 2px solid gold; height: 100%; width: 100%">
            <tr>
                <td style="font-size: 30px; text-align: center">上传照片</td>
                <td><input type="file" name="file" style="border: 0px; font-size: 30px;"/></td>
            </tr>

            <tr>
                <td colspan="2"><input type="submit" value="添加" style="width: 120px; height: 30px; background-color: gray; border: 0px; color: #fff5ee; font-size: 15px; margin-left: 103px;">
            </tr>
            </table>
            </form>

    </div>
</div>
</body>
</html>
