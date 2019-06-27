<%--
  Created by IntelliJ IDEA.
  User: taosh
  Date: 5/21/2019
  Time: 7:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="${app}/js/jquery-1.4.2.js"></script>
    <script>
        $(function () {

            $("#st").submit(

                function () {

                    $.ajax({
                        async: false,
                        type: "POST",
                        url:'${app}/update.do',
                        contentType : "application/x-www-form-urlencoded; charset=utf-8",
                        data:$("#st").serialize(),
                        dataType: "text",
                        success: function () {
                        },
                        error: function () {
                        }
                    })
                })
            })

    </script>
</head>
<body>
<form id="st">
<table>
    <tr>
        <td>性别</td>
        <td>
        <input id="r1" style="width: 15px;height: 15px;" name="gender" type="radio" value="男" />男
        <input id="r2" style="width: 15px;height: 15px;" name="gender" type="radio" value="女" />女
        </td>
    </tr>

    <tr>
        <td class="tds">性格：</td>
        <td>
            <input style="width: 15px;height: 15px;" name="character" type="radio" value="开朗" />开朗
            <input style="width: 15px;height: 15px;" name="character" type="radio" value="高冷" />高冷
            <input style="width: 15px;height: 15px;" name="character" type="radio" value="逗逼" />逗逼
        </td>
    </tr>

    <tr>
        <td class="tds">薪资：</td>
        <td>
            <input type="text" name="sal"
                   value="${ info.salary }"
            />
        </td>
    </tr>

    <tr>
        <td class="tds">身高：</td>
        <td>
            <input type="text" name="height"
                   value="${ info.height }"
            />
        </td>
    </tr>

    <tr>
        <td class="tds">邮箱：</td>
        <td>
            <input type="text" name="email"
                   value="${ info.email }"
            />
            <span></span>
        </td>
    </tr>

    <tr>
        <td>
            <input name="submit" type="submit" value="保存信息" >
        </td>
        <td>
            <input type="reset" value="重置" >
        </td>
    </tr>

</table>
</form>
</body>
</html>
