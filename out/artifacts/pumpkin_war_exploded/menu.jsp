<%--
  Created by IntelliJ IDEA.
  User: hoho
  Date: 2019/12/4
  Time: 14:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if(request.getSession().getAttribute("user")!=null){
        if(request.getSession().getAttribute("user").//判断是否是销售人员
                getClass().equals(User.class)){
            request.setAttribute("isSalesman",false);
            request.setAttribute("user",request.getSession().getAttribute("user"));
        }
        else request.setAttribute("isSalesman",true);
    }
%>
<html>
<head>
    <title>菜单</title>

    <style type="text/css">
        #menu .common {
            width: 200px;
            height: 60px;
            text-align: center;
            margin: 0 auto;
            display: inline-block;
            line-height: 60px;
            transition: background-color 0.5s;
            border-color: #ff400b;
            border-top-style: solid;
            border-left-style: solid;
            border-right-style: solid;

        }
        #menu .common:hover {
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
            font-size: x-large;

        }
        /*.common a{*/
        /*    color: black;*/
        /*}*/
        /*.common a:link{*/
        /*    color: white;*/
        /*}*/
        .common a:hover{
            color: white;
            text-decoration: none;
        }

    </style>
</head>
<body>
<div id="menu">

    <c:choose>
        <c:when test="${isSalesman}">



            <a href="goodsManage.jsp" class="menu-link" >
                <div class="common" id="goodsManage">
                    商品管理
                </div>
            </a>
            <a href="AddGoods.jsp" class="menu-link">
                <div class="common" id="addGoods" >添加商品</div>

            </a>
            <a href="record.jsp" class="menu-link">
                <div class="common" id="record" >日志记录</div>
            </a>
<%--            <div class="admin" id="salesList" onclick="location.href='salesList.jsp'">销售榜单</div>--%>

            <!--
            <a href="goodsManage.jsp">商品管理</a>
            <a href="AddGoods.jsp">添加商品</a>
            <a href="salesList.jsp">销售榜单</a>
            <a href="record.jsp">日志记录</a>
            -->

        </c:when>
        <c:otherwise>
            <c:choose>
                <c:when test="${user.username=='admin'}">
                    <a href="salesmanManage.jsp" class="menu-link">
                        <div  class="common" id="salesmanManage">销售人员管理</div>
                    </a>
                    <a href="goodsQuery.jsp?salesman=admin" class="menu-link">
                        <div  class="common" id="goodsQuery">商品销售业绩</div>
                    </a>
                    <a href="bigData.jsp" class="menu-link">
                        <div class="common" id="bigData">大数据</div>
                    </a>

                </c:when>
                <c:otherwise>
                    <a href="index.jsp" class="menu-link">
                        <div class="common" id="allGoods" >全部商品</div>
                    </a>
                    <a href="cart.jsp" class="menu-link">
                        <div class="common" id="cart" >购物车</div>
                    </a>
                    <a href="myorder.jsp" class="menu-link">
                        <div class="common" id="myOrder">我的订单</div>
                    </a>
                </c:otherwise>
            </c:choose>
        </c:otherwise>
    </c:choose>
</div>
<script>

</script>
</body>
</html>
