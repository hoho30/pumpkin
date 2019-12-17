<%@ page import="java.util.List" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="hello.world.servlet.*" %><%--
  Created by IntelliJ IDEA.
  User: hoho
  Date: 2019/12/2
  Time: 21:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if (request.getSession().getAttribute("user") != null &&
            (((User) request.getSession().getAttribute("user")).getUsername()).equals("admin")) {
        response.sendRedirect("/pumpkin/goodsManage.jsp");
    }

    DBUtilsDaoGoods dao = new DBUtilsDaoGoods();
    try {
        List list = dao.findAll();
        request.setAttribute("goodsList", list);
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="css/index.css">
    <title>$Title$</title>
    <style>
        #allGoods {
            background-color: #ff400b;
            color: white;
        }
    </style>

</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="menu.jsp" %>

<c:forEach items="${goodsList}" var="i">
    <div class="goods" id="${i.id}">

        <div><img src="${i.picture}" alt="${i.name}"></div>
        <div class="price">￥${i.price}</div>
        <div class="name">${i.name}</div>
        <div class="des">${i.description}</div>
        <div>
            <form action="AddCartServlet" method="post">
                <input type="hidden" name="id" value="${i.id}">
                <input type="hidden" name="number" value="1">
                <input type="submit" value="加入购物车" style="display: inline-block" onclick="addCart(this)">
                <div style="display: inline-block;color: #ff400b" ></div>
            </form>
        </div>
    </div>
</c:forEach>
<script>
function addCart(e) {
    e.nextElementSibling.innerHTML="已加入购物车";
}
</script>
</body>
</html>
