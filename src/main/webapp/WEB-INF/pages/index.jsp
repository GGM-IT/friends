<%@ page language="java" import="java.util.*" isELIgnored="false" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
<head>
    <link rel="stylesheet" href="${app}/css/index.css?version=2"/>
    <meta http-equiv="Content-type" content="text/html; charset=UTF-8" />

    <script type="text/javascript" src="${app}/js/jquery-1.4.2.js"></script>
    <%--<script type="text/javascript">
        $(function(){
            $("#search_btn").click(function(){
                var search = $(this).prev("input").val();
                window.location.href = "${app}/servlet/ProdListBySearchServlet?search="+search;
            });
        });
    </script>--%>
</head>
<body>
<div id="common_head">
    <div id="line1">
        <div id="content1">
            <c:if test="${ empty sessionScope.user }">
                <a href="${app}/jmplogin.do">登录</a>&nbsp;&nbsp;|&nbsp;&nbsp;
                <a href="${app}/jmpregist.do">注册</a>
            </c:if>
            <!-- 如果用户已经登陆了, 就提示欢迎xx回来 -->
            <c:if test="${ !(empty sessionScope.user) }">
                欢迎 ${ user.userName } 回来,
                <a href="${app}/myspacejmp.do">我的空间</a>&nbsp;|&nbsp;
                <a href="${app}/logout.do">退出</a>
            </c:if>
            <!-- 后台管理系统入口 -->

            <c:if test="${sessionScope.user.userRole == 'admin'}">
                &nbsp;&nbsp;|&nbsp;&nbsp;
                <a href="${app}/backend/manage.jsp">后台</a>
            </c:if>
        </div>
        <div id="content2">
            欢迎来到交友网
        </div>
    </div>
    <div id ="line2">
        <form onsubmit="return formObj.checkForm()" action="${app}/findperson.do" method="POST">
            <table style="font-size: 30px; margin-left: 50px; margin-top: 15px">
                <tr>
                    <td>
                        您要找的是？<br />
                        <label><input name="gender" type="radio" value="男" />他 </label>
                        <label><input name="gender" type="radio" value="女" />她 </label>
                        <label><input name="gender" type="radio" value="" />无所谓 </label>
                    </td>
                </tr>
                <tr>
                    <td>
                        身高要求<br />
                        <label><input name="height" type="radio" value="160" /> >1.6m </label>
                        <label><input name="height" type="radio" value="170" /> >1.7m </label>
                        <label><input name="height" type="radio" value="180" /> >1.8m </label>
                        <label><input name="height" type="radio" value="" /> 无所谓 </label>
                    </td>
                </tr>
                <tr>
                    <td>
                        收入要求<br />
                        <label><input name="salary" type="radio" value="10000" /> >10k </label>
                        <label><input name="salary" type="radio" value="15000" /> >15k </label>
                        <label><input name="salary" type="radio" value="20000" /> >20k </label>
                        <label><input name="salary" type="radio" value="30000" /> >30k </label>
                        <label><input name="salary" type="radio" value="" /> 无所谓 </label>
                    </td>
                </tr>
                <tr>
                    <td>
                        性格<br />
                        <label><input name="looks" type="radio" value="开朗" /> 开朗 </label>
                        <label><input name="looks" type="radio" value="高冷" /> 高冷 </label>
                        <label><input name="looks" type="radio" value="逗逼" /> 逗逼 </label>
                        <label><input name="looks" type="radio" value="" /> 无所谓 </label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="submit" value="点击查找"/>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</div>
</body>
</html>