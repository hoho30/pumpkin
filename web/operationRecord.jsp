<%@ page import="hello.world.javaClass.Record" %>
<%@ page import="hello.world.dao.RecordDao" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Collections" %><%--
  Created by IntelliJ IDEA.
  User: windows
  Date: 2020/6/2
  Time: 17:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="css/index.css">

    <title>操作日志</title>
    <style type="text/css">
        #bigData{
            background-color: #ff400b;
            color: white;
        }
    </style>
</head>
<body>
<%@include file="header.jsp"%>
<%@ include file="menu.jsp"%>
<a href="bigData.jsp" class="common-link">用户登录登出数据</a>
<a href="visitGoodsData.jsp" class="common-link">用户浏览商品数据</a>
<a href="buyGoodsData.jsp" class="common-link">用户购买商品数据</a>
<a href="operationRecord.jsp" class="common-link">操作日志</a>
<a href="persona.jsp" class="common-link" >用户画像</a>
<a href="salesTrends.jsp" class="common-link">销售趋势</a>
<%
    RecordDao recordDao = new RecordDao();
    try{
        List<Record> list = recordDao.findAll();
        Collections.reverse(list);
        pageContext.setAttribute("list",list);
    }catch (SQLException e){
        e.printStackTrace();
    }
%>
<table class="all-goods-record">
    <tr class="first">
        <td>
            时间
        </td>
        <td>
            用户名
        </td>
        <td>
            IP
        </td>
        <td>
            操作
        </td>
    </tr>
    <c:forEach items="${list}" var="item">
        <tr>
            <td>
               ${item.time}
            </td>
            <td>
                ${item.username}
            </td>
            <td>
                ${item.ip}
            </td>
            <td>
                ${item.operation}
            </td>

        </tr>
    </c:forEach>
</table>
</body>
</html>
