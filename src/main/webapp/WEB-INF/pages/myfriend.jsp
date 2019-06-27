<%--
  Created by IntelliJ IDEA.
  User: taosh
  Date: 5/20/2019
  Time: 12:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>我的朋友</title>
    <script type="text/javascript" src="${app}/js/jquery-1.4.2.js"></script>
    <script>
        $(function(){
            $(".st1").click(function(){
                    var url = $(this).attr("action");
                    $.post(url, {}, function(result){

                        if(result==1)
                            alert("已添加好友");
                        $("test span:first").remove();
                        $("test span:first").remove();
                        $("test span:first").remove();
                    })
                })

            $(".st2").click(function(){
                var url = $(this).attr("action");
                $.post(url, {}, function(result){
                    $("test span:first").remove();
                    $("test span:first").remove();
                    $("test span:first").remove();
                })
            })
        })
    </script>
</head>
<body>
<div style="width: 230px; height: 100%; float: left; border: 2px solid red">
<div>请求好友列表</div>
<c:forEach items="${pfriend}" var="s">
    <div>
        <test>
            <span>${s.username}</span>
        <span><a class="st1" href="javascript:void(0)" action="${app}/accept.do?myid=${sessionScope.user.id}&tid=${s.id}">接受</a>&nbsp;&nbsp;&nbsp;</span>
        <span><a class="st2" href="javascript:void(0)" action="${app}/deny.do?myid=${sessionScope.user.id}&tid=${s.id}">忽略</a></span>
        </test>
    </div>
</c:forEach>
</div style="width: 100%; height: 100%; float: left; border: 2px solid red">
    <c:forEach items="${friend}" var="s">
        <div style="float: left">
            <%--<div style="width: 100%"><img style="height: 350px" src="${app}/pic/user/${s.username}/${s.url}"></div>--%>
            <div style="width: 100%">
                <div><a href="${app}/friendetail.do?id=${s.user_id}"><img style="height: 350px" src="${app}/pic/user/${s.username}/${s.url}"></a></div>
                <div>好友:${s.username}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="${app}/deletefriend.do?myid=${sessionScope.user.id}&id=${s.user_id}">删除好友</a></div>
            </div>
        </div>
    </c:forEach>
<div>

</div>


</body>
</html>
