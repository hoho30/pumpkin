<%@ page import="hello.world.dao.DBUtilsDao" %><%--
  Created by IntelliJ IDEA.
  User: hoho
  Date: 2019/12/15
  Time: 19:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>账户信息管理</title>
    <link rel="stylesheet" type="text/css" href="css/index.css">
</head>
<body>
<%@ include file="header.jsp"%>
<%@ include file="menu.jsp"%>
<table>
    <tr>
        <td>用户名：</td>
        <td>${user.username}</td>
    </tr>
    <tr>
        <td>电子邮箱地址：</td>
        <td>${user.email}</td>
    </tr>
</table>
<button onclick="location.href='modifyEmail.jsp'">修改邮箱地址</button>
<button onclick="location.href='modifyPassword.jsp'">修改密码</button>
</body>
</html>
