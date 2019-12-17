<%@ page import="hello.world.servlet.DBUtilsDaoGoods" %>
<%@ page import="java.util.List" %>
<%@ page import="hello.world.servlet.Goods" %>
<%@ page import="java.util.Collections" %>
<%@ page import="java.util.Comparator" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: hoho
  Date: 2019/12/15
  Time: 3:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    DBUtilsDaoGoods dao=new DBUtilsDaoGoods();
    List<Goods> list=dao.findAll();
    Collections.sort(list, new Comparator<Goods>() {
        @Override
        public int compare(Goods o1, Goods o2) {
            return o2.getSales()-o1.getSales();
        }
    });
    request.setAttribute("goodsList1",list);
    List list2=new ArrayList(list);

    Collections.sort(list2, new Comparator<Goods>() {
        @Override
        public int compare(Goods o1, Goods o2) {
            return o2.getSales()*o2.getPrice()-o1.getSales()*o1.getPrice();
        }
    });
    request.setAttribute("goodsList2",list2);

%>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="css/index.css">
    <title>Title</title>
    <style>
        #salesList{
            background-color: #ff400b;
            color: white;
        }
        .list{
            display: inline-block;
            margin: 0 auto;
        }
        h1{
            margin-bottom: 0;
            color: #ff400b;
            text-align: left;
        }
        #list1{
            margin-right: 200px;
        }
    </style>
</head>
<body>
<%@ include file="header.jsp"%><br/>
<%@ include file="menu.jsp"%>

<div class="list" id="list1">
    <h1>销量榜</h1>
    <table >
    <tr class="first"><td>名次</td><td>商品id</td><td>商品名称</td><td>销量</td></tr>
    <c:set var="n" value="1"/>
    <c:forEach items="${goodsList1}" var="goods">
        <tr>
            <td>${n}</td>
            <c:set var="n" value="${n+1}"/>
            <td>${goods.id}</td>
            <td>${goods.name}</td>
            <td>${goods.sales}</td>
        </tr>
    </c:forEach>
</table>
</div>
<div class="list">
    <h1>销售额榜</h1>
    <table>
        <tr class="first"><td>名次</td><td>商品id</td><td>商品名称</td><td>销售额</td></tr>
        <c:set var="n" value="1"/>
        <c:forEach items="${goodsList2}" var="goods">
            <tr>
                <td>${n}</td>
                <c:set var="n" value="${n+1}"/>
                <td>${goods.id}</td>
                <td>${goods.name}</td>
                <td>${goods.sales*goods.price}</td>
            </tr>
        </c:forEach>
    </table>
</div>

</body>
</html>
