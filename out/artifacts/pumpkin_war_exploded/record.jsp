<%@ page import="hello.world.servlet.Record" %>
<%@ page import="hello.world.servlet.RecordDao" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.Collections" %><%--
  Created by IntelliJ IDEA.
  User: hoho
  Date: 2019/12/15
  Time: 15:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    RecordDao recordDao=new RecordDao();
    try{
        List list=recordDao.findAll();
        Collections.reverse(list);
        request.setAttribute("recordList",list);
    }catch (SQLException e){
        e.printStackTrace();
    }


%>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="css/index.css">
    <style>
        #record{
            background-color: #ff400b;
            color: white;
        }
    </style>
    <title>Title</title>
</head>
<body>
<%@ include file="header.jsp"%>
<%@ include file="menu.jsp"%>
<table>
    <tr class="first">
        <td>时间</td>
        <td>IP</td>
        <td>用户</td>
        <td>操作</td>
    </tr>
    <c:forEach items="${recordList}" var="item">
        <tr>
            <td>${item.time}</td>
            <td>${item.ip}</td>
            <td>${item.username}</td>
            <td>${item.operation}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
