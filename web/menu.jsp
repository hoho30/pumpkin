<%--
  Created by IntelliJ IDEA.
  User: hoho
  Date: 2019/12/4
  Time: 14:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

    <style type="text/css">
        #menu .common {
            width: 200px;
            height: 60px;
            text-align: center;
            margin: 0 auto;

            display: inline-block;
            padding: auto;
            line-height: 60px;
            transition: background-color 0.5s;

        }

        #menu .admin {
            width: 200px;
            height: 60px;
            text-align: center;
            margin: 0 auto;
            display: inline-block;
            padding: auto;
            line-height: 60px;
            transition: background-color 0.5s;

        }
        #menu .common:hover {
            background-color: #ff400b;
            color: white;
        }
        #menu .admin:hover{
            background-color: #ff400b;
            color: white;
        }

        #menu{
            width: 100%;
            border-bottom-style: solid;
            border-color: #ff400b;
            border-width: 3px;
            margin-left: 0;
            margin-right: 0;
            font-size: large;

        }


    </style>
</head>
<body>
<div id="menu">
    <c:choose>
        <c:when test="${user.username=='admin'}">


            <div class="admin" id="goodsManage" onclick="location.href='goodsManage.jsp'">商品管理</div>
            <div class="admin" id="addGoods" onclick="location.href='AddGoods.jsp'">添加商品</div>
            <div class="admin" id="salesList" onclick="location.href='salesList.jsp'">销售榜单</div>
            <div class="admin" id="record" onclick="location.href='record.jsp'">日志记录</div>
            <!--
            <a href="goodsManage.jsp">商品管理</a>
            <a href="AddGoods.jsp">添加商品</a>
            <a href="salesList.jsp">销售榜单</a>
            <a href="record.jsp">日志记录</a>
            -->

        </c:when>
        <c:otherwise>
            <div class="common" id="allGoods" onclick="location.href='index.jsp'">全部商品</div>
            <div class="common" id="cart" onclick="location.href='cart.jsp'">购物车</div>
            <div class="common" id="myOrder" onclick="location.href='myorder.jsp'">我的订单</div>
        </c:otherwise>
    </c:choose>
</div>
<script>

</script>
</body>
</html>
