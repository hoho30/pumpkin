<%@ page import="hello.world.javaClass.Record" %>
<%@ page import="hello.world.dao.RecordDao" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.Collections" %>
<%@ page import="hello.world.dao.GoodsRecordDao" %>
<%@ page import="hello.world.javaClass.GoodsRecord" %><%--
  Created by IntelliJ IDEA.
  User: hoho
  Date: 2019/12/15
  Time: 15:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
//    RecordDao recordDao=new RecordDao();
    GoodsRecordDao goodsRecordDao = new GoodsRecordDao();

    try{
        Salesman salesman = (Salesman) request.getSession().getAttribute("user");
        System.out.println("sname："+salesman.getName());
        List<GoodsRecord> list= goodsRecordDao.findAllGoodsRecord(salesman.getName());
//        List<Record> list=recordDao.findAll();
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
    <title>商品日志记录</title>
</head>
<body>
<%@ include file="header.jsp"%>
<%@ include file="menu.jsp"%>
<table class="all-goods-record">
    <tr class="first">
        <td>时间</td>
        <td>用户</td>
        <td>操作</td>
        <td>商品id</td>
        <td>商品名称</td>

    </tr>
    <c:forEach items="${recordList}" var="item">
        <tr>
            <td>${item.time}</td>
            <td>${item.userName}</td>
            <td>${item.operation}</td>
            <td>${item.goodsId}</td>
            <td>${item.goodsName}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
