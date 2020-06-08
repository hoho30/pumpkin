<%@ page import="hello.world.dao.DBUtilsDaoGoods" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="hello.world.javaClass.Goods" %><%--
  Created by IntelliJ IDEA.
  User: hoho
  Date: 2019/12/14
  Time: 19:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
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
    <title>商品管理</title>
    <style>
        #goodsManage {
            background-color: #ff400b;
            color: white;
        }

        table {
            border-style: none;
            width: 100%;
        }


    </style>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="menu.jsp" %>
<%
    if(request.getParameter("name")!=null){
        request.setAttribute("name",request.getParameter("name"));
    }
%>
<div class="body" id="ma">
    <c:forEach items="${goodsList}" var="i">
<%--        <p>i.s:${i.getSalesmanName()}..name:${name}</p>--%>
        <c:if test="${i.salesmanName==name}">
<%--        <c:if test="${true}">--%>
            <div class="goods">
                <div>
                    <a href="goodsInformation.jsp?id=${i.id}">
                        <img src="${i.picture}" alt="${i.name}"/>
                    </a>
                </div>
                <div class="info">
                    <table>
                        <tr>
                            <td class="td1">id：</td>
                            <td>${i.id}</td>
                        </tr>
                        <tr>
                            <td class="td1">商品名称：</td>
                            <td>${i.name}</td>
                        </tr>
<%--                        <tr>--%>
<%--                            <td class="td1">价格：</td>--%>
<%--                            <td>￥${i.price}</td>--%>
<%--                        </tr>--%>
<%--                        <tr>--%>
<%--                            <td class="td1">销量：</td>--%>
<%--                            <td>${i.sales}</td>--%>
<%--                        </tr>--%>
                    </table>
<%--                    <div class="adminDes">描述：${i.description}</div>--%>
                </div>

<%--                <hr/>--%>
                <div>

                    <a href="modifyGoods.jsp?id=${i.id}" class="menu-link">
                        <input type="submit" value="修改">
                    </a>
                    <a href="DeleteGoodsServlet?id=${i.id}" class="menu-link">
                        <input type="submit" value="删除">

                    </a>
                </div>
            </div>
        </c:if>
    </c:forEach>

</div>

</body>
</html>
