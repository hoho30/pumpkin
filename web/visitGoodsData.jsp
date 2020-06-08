<%@ page import="hello.world.dao.VisitGoodsDataDao" %>
<%@ page import="java.util.List" %>
<%@ page import="hello.world.javaClass.VisitGoodsData" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.Collections" %><%--
  Created by IntelliJ IDEA.
  User: windows
  Date: 2020/6/2
  Time: 1:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户浏览商品数据</title>
    <link rel="stylesheet" type="text/css" href="css/index.css">
    <style type="text/css">
        #bigData{
            background-color: #ff400b;
            color: white;
        }
    </style>
</head>
<body>
<%@ include file="header.jsp"%>
<%@ include file="menu.jsp"%>
<%
    VisitGoodsDataDao visitGoodsDataDao = new VisitGoodsDataDao();
    try {

        List<VisitGoodsData> list = visitGoodsDataDao.findAllVisitGoodsData();
        Collections.reverse(list);
        pageContext.setAttribute("list",list);

    }catch (SQLException e){
        e.printStackTrace();
    }
%>
<a href="bigData.jsp" class="common-link">用户登录登出数据</a>
<a href="visitGoodsData.jsp" class="common-link">用户浏览商品数据</a>
<a href="buyGoodsData.jsp" class="common-link">用户购买商品数据</a>
<a href="operationRecord.jsp" class="common-link">操作日志</a>
<a href="persona.jsp" class="common-link" >用户画像</a>
<a href="salesTrends.jsp" class="common-link">销售趋势</a>
<table class="all-goods-record">
    <tr class="first">
        <td>
            时间
        </td>
        <td>
            用户名
        </td>
        <td>
            商品id
        </td>
        <td>
            商品名称
        </td>
        <td>
            商品类别
        </td>
        <td>
            浏览时长
        </td>
    </tr>
    <c:forEach items="${list}" var="item">
        <tr>
            <td>
                ${item.datetime}
            </td>
            <td>
                ${item.name}
            </td>
            <td>
                ${item.id}
            </td>
            <td>
                ${item.goodsName}
            </td>
            <td>
                ${item.category}
            </td>
            <td>
                ${item.time}
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
