<%--
  Created by IntelliJ IDEA.
  User: taosh
  Date: 5/19/2019
  Time: 6:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="${app}/js/jquery-1.4.2.js"></script>
    <script>
        $(function(){
            $("#st2").click(
                function () {
                    var v3 = $("#pc1").val();
                    var v4 = $("#pc2").val();
                    $.post("${app}"
                        +"addfriend.do",
                        {"fromid": v3, "toid": v4}, function(result){

                            if(result==1)
                                alert("好友请求已发送");
                        })
                })
            $(".st").click(function(){

                    var temp = $(this)[0].src;
                    var s = temp.lastIndexOf('.');
                    var v1 = temp.substring(0,s-1);
                    var v2;
                    var v3 = $("#pc1").val();
                    var v4 = $("#pc2").val();
                    if(v3 == '') {
                        alert("登陆用户才能点赞");
                        return;
                    }
                    var v5;
                    if(temp.search('1.jpg') != -1) {
                        v2 = v1 + '2.jpg';
                        v5 = 'yes';
                    }
                    else {
                        v2 = v1 + '1.jpg';
                        v5 = 'no';
                    }
                    // alert(v5);
                    // alert($(this)[0].src);
                    $.post("${app}"
                    +"changelike.do",
                    {"fromid": v3, "toid": v4, "val": v5}, function(result){
                        // alert(result);
                        // alert(v2);

                    });
                $(this)[0].src = v2;


            })
        })
    </script>
</head>
<body>
<div style="height: 500px">
<div style="font-size: 30px; color: brown">
    用户名:${userinfo.username}<br/>性别:${userinfo.gender}<br/>性格:${userinfo.charact}
    <br/>薪资:${userinfo.salary}<br/>身高:${userinfo.height}<br/>email地址:${userinfo.email}
</div>
<div style="margin-left: 800px; float: left">
    <c:if test="${islike == 'yes'}">
        <img class="st" style="width: 50px" src="${app}/pic/userdeatil/2.jpg"/>

    </c:if>
    <c:if test="${islike != 'yes'}">
        <img class="st" style="width: 50px" src="${app}/pic/userdeatil/1.jpg"/>
    </c:if>
</div>
    <div style="float: left">
    <c:if test="${ !(empty sessionScope.user) }">
        <div style="margin-left: 100px">
            <img style="width: 80px" id="st2" src="${app}/pic/index/5.jpg">
        </div>
    </c:if>
    </div>
</div>

<input id="pc1" type="hidden" value="${sessionScope.user.id}" />
<input id="pc2" type="hidden" value="${userinfo.id}" />

    <c:forEach items="${userpics}" var="s">
        <div style="float: left">
            <img style="height: 300px" src="${app}/pic/user/${userinfo.username}/${s}"/>
        </div>
    </c:forEach>
</body>
</html>
