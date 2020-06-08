<%--
  Created by IntelliJ IDEA.
  User: windows
  Date: 2020/5/24
  Time: 16:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>销售人员登陆</title>
    <link rel="stylesheet" type="text/css" href="css/index.css">
    <style type="text/css">
        table{
            border: none;
            .salesman-login tr:hover{
                background-color: #fffff5;

            }
        }

    </style>
</head>
<body>
<%@include file="header.jsp"%>
<%@ include file="menu.jsp"%>
<form action="SalesmanLoginServlet" method="post" class="form">
    <table class="salesman-login">
        <tr>
            <td>
                销售人员用户名：
            </td>
            <td>
                <input type="text" name="username"/><br/>
            </td>
        </tr>
        <tr>
            <td>
                密码：
            </td>
            <td>
                <input type="password" name="password"/><br/>
            </td>
        </tr>
    </table>
<%--    自动登录<input type="checkbox" name="autoLogin" value="${60*60*24*7}"/><br/>--%>
    <input type="submit" value="登录" class="login-button"/>
    <br/>
    <a href="login.jsp" class="common-link"><返回用户登陆</a>

<%--    <input type="submit" formaction="logon.jsp" value="注册">--%>
</form>
<%
    if(request.getAttribute("tips")!=null){
        out.println(request.getAttribute("tips"));
        request.removeAttribute("tips");
    }
%>
</body>
</html>
