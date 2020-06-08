<%--
  Created by IntelliJ IDEA.
  User: hoho
  Date: 2019/12/3
  Time: 15:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登陆</title>
    <link rel="stylesheet" type="text/css" href="css/index.css">
</head>
<body>
<%@include file="header.jsp"%>
<%@ include file="menu.jsp"%>
<form action="LoginServlet" method="post" class="form">
    用户名：<input type="text" name="username"/><br/>
    &emsp;密码：<input type="password" name="password"/><br/>
    自动登录<input type="checkbox" name="autoLogin" value="${60*60*24*7}"/><br/>
    <input type="submit" value="登录" class="login-button"/>
    <input type="submit" formaction="logon.jsp" value="注册" class="login-button">
    <br/>
    <a href="salesmanLogin.jsp" class="common-link">销售人员登陆></a>
</form>
<%
    if(request.getAttribute("tips")!=null){
        out.println(request.getAttribute("tips"));
        request.removeAttribute("tips");
    }
%>
</body>
</html>
