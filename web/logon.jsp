<%--
  Created by IntelliJ IDEA.
  User: hoho
  Date: 2019/12/3
  Time: 15:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册</title>
    <link rel="stylesheet" type="text/css" href="css/index.css">
</head>
<body>
<%@include file="header.jsp"%>
<%@ include file="menu.jsp"%>
<form action="LogonServlet" method="post" class="form">
    &emsp;&emsp;&emsp;用户名：<input type="text" name="username"/><br/>
    &emsp;&emsp;电子邮箱：<input type="text" name="email"><br/>
    &emsp;&emsp;&emsp;&emsp;密码：<input type="password" name="password"/><br/>
    再次输入密码：<input type="password" name="password_s"/><br/>
    <input type="submit" value="注册"/>
</form>
<%
    if(request.getAttribute("tips")!=null){
        out.println(request.getAttribute("tips"));
        request.removeAttribute("tips");
    }
%>
</body>
</html>
