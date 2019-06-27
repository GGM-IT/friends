<%--
  Created by IntelliJ IDEA.
  User: taosh
  Date: 5/19/2019
  Time: 3:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>查找结果</title>
    <link rel="stylesheet" href="${app}/css/match.css"/>
</head>
<body>
<div style="text-align: center; font-size: 50px; background-color: gold">匹配用户</div>
    <c:forEach items="${userlist}" var="s">
        <div style="float: left">
            <div>
                <img style="height: 260px" src="${app}/pic/user/${s.username}/${s.url}"/>
            </div>
            <div style="text-align: center">
                    ${s.user_id}
                <a style="width: 50px" href="userdetail.do?id=${s.user_id}">查看详情</a>
            </div>
        </div>
    </c:forEach>
</body>
</html>
