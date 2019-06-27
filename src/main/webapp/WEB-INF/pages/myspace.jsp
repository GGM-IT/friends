<%@page import="com.friend.pojo.User"%>
<%@ page language="java" import="java.util.*" isELIgnored="false" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
<head>

<meta http-equiv="Content-type" content="text/html; charset=UTF-8" />
	<link rel="stylesheet" href="${app}/css/myspace.css?version=2"/>
<script type="text/javascript" src="${app}/js/jquery-1.4.2.js"></script>

</head>
<body>
<div id="common_head">
	<div id="line1" style="text-align: center">
		<h1 style="color: black">我的空间</h1>

	</div>
</div>
<div id="line2">

</div>
<div id="line3">
		<div id="content">
			<ul>
				<li><a href="${app}/index.jsp">首页</a></li>
				<li><a href="${app}/myfriend.do">我的好友</a></li>
				<li><a href="${app}/mypics.do">我的照片</a></li>
				<li><a href="${app}/editinfo.do?id=${sessionScope.user.id}">编辑个人资料</a></li>
			</ul>
		</div>
	</div>
</div>
<div>
	<div class="st">用户名:${show.username}</div>
	<div class="st">性别:${show.gender}</div>
	<div class="st">薪资:${show.salary}</div>
	<div class="st">身高:${show.height}</div>
	<div class="st">email地址:${show.email}</div>
</div>
</body>
</html>
