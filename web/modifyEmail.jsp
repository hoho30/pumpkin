<%--
  Created by IntelliJ IDEA.
  User: hoho
  Date: 2019/12/15
  Time: 20:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="css/index.css">
</head>
<body>
<%@include file="header.jsp" %>
<%@ include file="menu.jsp" %>
<form action="modifyUser.jsp" method="post">
    请输入新的邮箱地址：<input type="text" name="email">
    <input formaction="ModifyEmailServlet" type="submit" value="确认">
    <button >返回</button>
</form>
</body>
</html>
