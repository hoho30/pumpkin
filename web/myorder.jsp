<%@ page import="java.util.List" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="hello.world.servlet.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Collections" %><%--
  Created by IntelliJ IDEA.
  User: hoho
  Date: 2019/12/4
  Time: 19:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

    User user=(User)request.getSession().getAttribute("user");
    OrderDao orderDao=new OrderDao();
    try{
        List<Order> list=orderDao.find(user.getUsername());
//            for(Order i:list){
//                System.out.println(i.getNumber());
//            }
        Collections.reverse(list);
        request.setAttribute("orders",list);

    }catch (SQLException e){
        e.printStackTrace();
    }
%>

<html>
<head>
    <link rel="stylesheet" type="text/css" href="css/index.css">
    <title>Title</title>
    <style>
        #myOrder{
            background-color: #ff400b;
            color: white;
        }
        h1{
            color: #ff400b;
        }
    </style>
</head>
<body>

<%@include file="header.jsp"%>
<%@ include file="menu.jsp"%>
<c:choose>
    <c:when test="${orders==null||orders=='[]'}">
        <h1>您还没购买过任何商品呢</h1>
    </c:when>
    <c:otherwise>
        <table>
            <tr class="first">
                <td>订单号</td>
                <td>商品名称</td>
                <td>数量</td>
                <td>价格</td>
                <td>小计</td>
                <td>时间</td>
            </tr>
            <c:set var="Lid" />
            <c:set var="total" value="0"/>
            <tr>
                <td><hr/></td>
                <td><hr/></td>
                <td><hr/></td>
                <td><hr/></td>
                <td><hr/></td>
                <td><hr/></td>
            </tr>
            <c:forEach items="${orders}" var="entry" varStatus="status">
                <c:if test="${(entry.id!=Lid) && (status.count>1)}">
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td class="price">合计：￥${total}</td>
                    </tr>
                    <tr>
                        <td><hr/></td>
                        <td><hr/></td>
                        <td><hr/></td>
                        <td><hr/></td>
                        <td><hr/></td>
                        <td><hr/></td>
                    </tr>
                    <c:set var="total" value="0"/>
                </c:if>
                <c:set var="Lid" value="${entry.id}"/>
                <tr>
                    <td>${entry.id}</td>
                    <td>${entry.name}</td>
                    <td>${entry.number}</td>
                    <td>${entry.price}</td>
                    <td>${entry.number*entry.price}</td>
                    <td>${entry.date}</td>
                </tr>
                <c:set var="total" value="${total+entry.number*entry.price}"/>

            </c:forEach>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td class="price">合计：￥${total}</td>
            </tr>
        </table>
    </c:otherwise>
</c:choose>

</body>
</html>
