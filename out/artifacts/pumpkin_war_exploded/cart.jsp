<%@ page import="java.util.Map" %>
<%@ page import="hello.world.servlet.Goods" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="hello.world.servlet.RecordDao" %><%--
  Created by IntelliJ IDEA.
  User: hoho
  Date: 2019/12/4
  Time: 1:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="css/index.css">
    <title>Title</title>
    <style>
        #cart{
            background-color: #ff400b;
            color: white;
        }
        input[type=submit]{
            margin: 0;
        }
        form{
            margin: auto;
        }

    </style>

<%--    <script src="js/cart.js"></script>--%>
</head>
<body>
<%@include file="header.jsp"%>
<%@ include file="menu.jsp"%>
<%--<h1 id="cartNull">购物车空空如也，快去选购商品吧</h1>--%>
<c:choose>
    <c:when test="${cart==null||cart=='{}'}">
        <h1 id="cartNull">购物车空空如也，快去选购商品吧</h1>
    </c:when>
    <c:otherwise>
        <div id="cartText"><table>
            <tr class="first">
                <td >序号</td>
                <td >商品名称</td>
                <td >价格</td>
                <td >数量</td>
                <td >小计</td>
            </tr>
            <c:set value="0" var="total"/>
            <c:forEach items="${cart}" var="entry" varStatus="vs">
                <c:if test="${entry.value>0}">
                    <tr id="${vs.count}">
                        <td >${vs.count}</td>
                        <td >${entry.key.name}</td>
                        <td >￥${entry.key.price}</td>
                        <td>
                            <form method="post" class="cartNum">
                                <input hidden="hidden" value="${vs.count}" name="xuHao">
                                <input type="hidden" value="${entry.key.id}" name="id">
                                <input type="submit" value="-" formaction="ReduceCartGoodsNumServlet">
                                    ${entry.value}
                                <input value="+" type="submit" formaction="AddCartGoodsNumServlet">
                            </form>
                        </td>
                        <td >￥${entry.value*entry.key.price}</td>
                    </tr>
                    <c:set value="${total+entry.value*entry.key.price}" var="total"/>
                </c:if>
            </c:forEach>
            <br/>
        </table>
            <div >
                合计：<div id="total">￥${total}</div>
            </div>
            <form action="BuyServlet" method="post">
                <input type="submit" value="提交订单">
            </form>
        </div>
    </c:otherwise>
</c:choose>

</body>
</html>
