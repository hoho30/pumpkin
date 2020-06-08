<%--
  Created by IntelliJ IDEA.
  User: windows
  Date: 2020/5/29
  Time: 17:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改销售人员密码</title>
    <link rel="stylesheet" type="text/css" href="css/index.css">

</head>
<body>
<%@ include file="header.jsp"%>
<%@ include file="menu.jsp"%>
<form action="salesmanManage.jsp" method="post">
    <input type="hidden" name="name" value="${param.name}"/>
    <table>
        <tr><td>请输入新密码：</td><td><input type="password" name="password1"></td></tr>
        <tr><td>请再次输入新密码：</td><td><input type="password" name="password2"></td></tr>
    </table>
    <input type="submit" formaction="UpdatePasswordServlet" value="确认">
    <input type="submit" value="返回">

</form>
<c:if test="${tips!=null}">
    <div>${tips}</div>
</c:if>
</body>
</html>
