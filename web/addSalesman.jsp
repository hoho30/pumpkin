<%--
  Created by IntelliJ IDEA.
  User: windows
  Date: 2020/5/29
  Time: 18:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加销售人员</title>
    <link rel="stylesheet" type="text/css" href="css/index.css">

</head>
<body>
<%@ include file="header.jsp"%><br/>
<%@ include file="menu.jsp"%>
<form action="AddSalesmanServlet" method="post">
    <input type="text" name="name" placeholder="用户名">
    <br/>
    <input type="password" name="p1" placeholder="密码">
    <br/>
    <input type="password" name="p2" placeholder="再次输入密码">
    <br/>
    <input class="add-salesman-button" type="submit" value="确定">
    <br/>
    <c:if test="${tips!=null}">
        ${tips}
    </c:if>
</form>

</body>
</html>
