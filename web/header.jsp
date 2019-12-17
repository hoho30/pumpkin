<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="hello.world.servlet.User" %><%--
  Created by IntelliJ IDEA.
  User: hoho
  Date: 2019/12/4
  Time: 14:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        #header button{
            margin: 0;
        }
    </style>
</head>
<body>
<div class="h" id="logo"><a href="index.jsp"><img alt="logo" src="graph/logo.png"/></a> </div>
<div id="header" class="h">
    <c:set var="user" value="${user}"/>
    <c:choose>
        <c:when test="${user==null}"><a href="login.jsp"><button>请登录</button></a> </c:when>
        <c:otherwise>${user.getUsername()}，欢迎您&nbsp <a href="modifyUser.jsp"><button>账号管理</button></a> &nbsp&nbsp<a href="LogoutServlet"><button>退出</button></a></c:otherwise>
    </c:choose>
</div>
<div></div>

</body>
</html>
