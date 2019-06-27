<%--
  Created by IntelliJ IDEA.
  User: taosh
  Date: 5/18/2019
  Time: 12:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册成功</title>
</head>
<body>
<h1>恭喜你注册成功，3秒后跳转到首页</h1>
    <% response.setHeader("refresh","3;/index.jsp");%>
</body>
</html>
