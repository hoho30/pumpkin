<%--
  Created by IntelliJ IDEA.
  User: hoho
  Date: 2019/12/15
  Time: 20:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改用户密码</title>
    <link rel="stylesheet" type="text/css" href="css/index.css">
</head>
<body>
<%@ include file="header.jsp"%>
<%@ include file="menu.jsp"%>
<form action="modifyUser.jsp" method="post">
    <table>
        <tr><td>请输入新密码：</td><td><input type="password" name="password1"></td></tr>
        <tr><td>请再次输入新密码：</td><td><input type="password" name="password2"></td></tr>
    </table>
    <input type="submit" formaction="ModifyPasswordServlet" value="确认">
    <button>返回</button>
</form>
<c:if test="${tips!=null}">
    <div>${tips}</div>
</c:if>
</body>
</html>
