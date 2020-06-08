<%@ page import="hello.world.javaClass.LoginData" %>
<%@ page import="hello.world.dao.LoginDataDao" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.Collections" %><%--
  Created by IntelliJ IDEA.
  User: windows
  Date: 2020/6/1
  Time: 17:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="css/index.css">

    <title>大数据</title>
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
<%
    LoginDataDao loginDataDao = new LoginDataDao();
    try {
        List<LoginData> list = loginDataDao.findAllLoginData();
        Collections.reverse(list);
        request.setAttribute("loginDataList" ,list);

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
            ip
        </td>
        <td>
            登陆或登出
        </td>
    </tr>
    <c:forEach items="${loginDataList}" var="item">
        <tr>
            <td>
                ${item.time}
            </td>
            <td>
                ${item.name}
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
