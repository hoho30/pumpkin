<%@ page import="hello.world.servlet.DBUtilsDaoGoods" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.SQLException" %><%--
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
    <title>Title</title>
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
<br/>
<%@ include file="menu.jsp" %>
<div class="body" id="ma">
    <c:forEach items="${goodsList}" var="i">
        <div class="goods">
            <div><img src="${i.picture}" alt="${i.name}"></div>
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
                    <tr>
                        <td class="td1">价格：</td>
                        <td>￥${i.price}</td>
                    </tr>
                    <tr>
                        <td class="td1">销量：</td>
                        <td>${i.sales}</td>
                    </tr>
                </table>
                <div class="adminDes">描述：${i.description}</div>
            </div>

            <hr/>
            <div>
                <form method="post">
                    <input type="hidden" name="id" value="${i.id}">
                    <input type="submit" value="修改" formaction="modifyGoods.jsp">
                    <input type="submit" value="删除" formaction="DeleteGoodsServlet">
                </form>
            </div>
        </div>
    </c:forEach>

</div>

</body>
</html>
