<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="hello.world.dao.SalesmanDao" %>
<%@ page import="hello.world.javaClass.Salesman" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: windows
  Date: 2020/5/29
  Time: 16:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>销售人员管理</title>
    <link rel="stylesheet" type="text/css" href="css/index.css">
    <style type="text/css">
        #salesmanManage{
            background-color: #ff400b;
            color: white;
        }
    </style>
</head>
<body>
<%
    SalesmanDao salesmanDao = new SalesmanDao();
    try{
        request.setAttribute("salesmanList",salesmanDao.findAllSalesman());
    }catch (SQLException e){
        e.printStackTrace();
    }
%>
<%@include file="header.jsp"%>
<%@ include file="menu.jsp"%>
<div class="add-salesman-div">
    <a class="common-link"  href="addSalesman.jsp">添加销售人员</a>

</div>
<table class="all-goods-record">
    <tr class="first">
        <td>
            账户
        </td>
        <td>
            操作
        </td>
    </tr>
    <c:forEach items="${salesmanList}" var="item">
        <tr>
            <td>
                <a class="common-link" href="goodsQuery.jsp?salesman=${item.name}" target="_blank">${item.name}</a>
            </td>
            <td>
                <a class="common-link"  href="updatePassword.jsp?name=${item.name}">修改密码</a>
                <a class="common-link"  href="DeleteSalesmanServlet?name=${item.name}">删除</a>
            </td>
        </tr>
    </c:forEach>
</table>

</body>
</html>
