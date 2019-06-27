<%--
  Created by IntelliJ IDEA.
  User: taosh
  Date: 5/21/2019
  Time: 1:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%= request.getSession().getServletContext().getRealPath("/")  %>
</body>
</html>
