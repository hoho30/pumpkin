<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="hello.world.dao.DBUtilsDao" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.List" %>
<%@ page import="hello.world.javaClass.User" %>
<%@ page import="hello.world.javaClass.Persona" %><%--
  Created by IntelliJ IDEA.
  User: windows
  Date: 2020/6/3
  Time: 20:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="css/index.css">

    <title>用户画像</title>
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
    DBUtilsDao dbUtilsDao = new DBUtilsDao();
    Map<String,int[]> map = new HashMap<>();
    try{
        List<User> userList = dbUtilsDao.findAll();
        for(User user:userList){
            if(user.getUsername().equals("admin")){
                continue;
            }
            Persona persona = new Persona(user.getUsername());
            map.put(user.getUsername(),persona.getPersona());
        }
        pageContext.setAttribute("map",map);
    }catch (SQLException e){
        e.printStackTrace();
    }
%>
<table class="all-goods-record">
    <tr class="first">
        <td>
            用户
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
    <c:forEach items="${map}" var="item">
        <tr>
            <td>
                ${item.key}
            </td>
            <td>
                ${item.value[0]}
            </td>
            <td>
                    ${item.value[1]}
            </td>
            <td>
                    ${item.value[2]}
            </td>
            <td>
                    ${item.value[3]}
            </td>
            <td>
                    ${item.value[4]}
            </td>
            <td>
                    ${item.value[5]}
            </td>
            <td>
                    ${item.value[6]}
            </td>
            <td>
                    ${item.value[7]}
            </td>

        </tr>
    </c:forEach>
</table>
</body>
</html>
