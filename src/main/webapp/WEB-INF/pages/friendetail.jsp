<%--
  Created by IntelliJ IDEA.
  User: taosh
  Date: 5/22/2019
  Time: 7:53 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="${app}/js/jquery-1.4.2.js"></script>

</head>


<div style="font-size: 50px; color: palevioletred; width: 100%; text-align: center">TA的相册</div>
<c:forEach items="${pics1}" var="s">

    <div style="float: left">
        <img style="height: 200px" src="${app}/pic/user/${friend1.username}/${s}">
    </div>
</c:forEach>
    <div style="clear: both; font-size: 30px; color: cornflowerblue">个人信息</div>
    <div style="font-size: 25px; color: cornflowerblue">
        用户id:&nbsp;&nbsp;&nbsp;${friend1.username}<br/>
        性别:&nbsp;&nbsp;&nbsp;${friend1.gender}<br/>
        性格:&nbsp;&nbsp;&nbsp;${friend1.charact}<br/>
        薪资:&nbsp;&nbsp;&nbsp;${friend1.salary}<br/>
        身高:&nbsp;&nbsp;&nbsp;${friend1.height}<br/>
        email:&nbsp;&nbsp;&nbsp;${friend1.email}<br/><br/>
    </div>
    <div style="font-size: 30px; color: palevioletred; width: 50%; text-align: center;float: left">
        TA给你的留言<br/>
        <c:forEach items="${fmessage}" var="s">
            ${s}<br/>
        </c:forEach>

    </div>
    <div style="font-size: 30px; color: palevioletred; width: 50%; text-align: center;float: left">
        给TA留言<br/><br/>
        <form action="${app}/message.do" method="POST">
            <input type="hidden" name="friendid" value="${friend1.id}"/>
            <textarea placeholder="对TA说些什么吧..." name="message" style="height: 200px; width: 500px"></textarea><br/>
            <input name="submit" type="submit" value="提交留言" >
        </form>
    </div>

    </textarea>
    </div>
</body>
</html>
