<%@ page import="hello.world.javaClass.Persona" %><%--
  Created by IntelliJ IDEA.
  User: windows
  Date: 2020/6/3
  Time: 22:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="css/index.css">

    <title>商品销售趋势</title>
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
    Persona persona = new Persona("");
    pageContext.setAttribute("persona",persona.getPersona());
%>
<table class="all-goods-record">
    <tr class="first">
        <td>
            商品类型
        </td>
        <td>
            服装
        </td>
        <td>
            鞋靴
        </td>
        <td>
            数码
        </td>
        <td>
            家电
        </td>
        <td>
            洗护
        </td>
        <td>
            珠宝
        </td>
        <td>
            生鲜
        </td>
        <td>
            零食
        </td>

    </tr>
    <tr>
        <td>
            趋势值
        </td>
        <td>
            ${persona[0]}
        </td>
        <td>
            ${persona[1]}
        </td>
        <td>
            ${persona[2]}
        </td>
        <td>
            ${persona[3]}
        </td>
        <td>
            ${persona[4]}
        </td>
        <td>
            ${persona[5]}
        </td>
        <td>
            ${persona[6]}
        </td>
        <td>
            ${persona[7]}
        </td>

    </tr>
</table>
</body>
</html>
