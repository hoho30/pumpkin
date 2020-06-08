
<%@ page import="hello.world.dao.DBUtilsDaoGoods" %>
<%@ page import="hello.world.javaClass.Goods" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="hello.world.dao.GoodsRecordDao" %>
<%@ page import="java.util.List" %>
<%@ page import="hello.world.javaClass.GoodsRecord" %>
<%@ page import="java.util.Collections" %><%--
  Created by IntelliJ IDEA.
  User: windows
  Date: 2020/5/27
  Time: 16:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    DBUtilsDaoGoods dbUtilsDaoGoods = new DBUtilsDaoGoods();
    GoodsRecordDao goodsRecordDao = new GoodsRecordDao();

    try {
        Goods goods = dbUtilsDaoGoods.find(Integer.parseInt(request.getParameter("id")));
        request.setAttribute("goods", goods);
        List<GoodsRecord> list= goodsRecordDao.findGoodsRecord(goods.getId());
        Collections.reverse(list);
        request.setAttribute("goodsRecord",list);
    } catch (SQLException e) {
        e.printStackTrace();
    }


%>
<html>
<head>
    <title>商品信息</title>
    <link rel="stylesheet" type="text/css" href="css/index.css">

</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="menu.jsp" %>
<div id="moImg"><img src="${goods.picture}" alt="${goods.name}"></div>
<table class="info-table">
    <tr>
        <td class="info-table-first">
            id：
        </td>
        <td>
            ${goods.id}
        </td>
    </tr>
    <tr>
        <td class="info-table-first">
            名称：
        </td>
        <td>
            ${goods.name}
        </td>
    </tr>
    <tr>
        <td class="info-table-first">
            价格：
        </td>
        <td>
            ${goods.price}
        </td>
    </tr>
    <tr>
        <td class="info-table-first">
            商品类型：
        </td>
        <td>
            <c:choose>
                <c:when test="${goods.category=='clothing'}">
                    服装
                </c:when>
                <c:when test="${goods.category=='shoes'}">
                    鞋靴
                </c:when>
                <c:when test="${goods.category=='digital'}">
                    数码
                </c:when>
                <c:when test="${goods.category=='household'}">
                    家电
                </c:when>
                <c:when test="${goods.category=='wash'}">
                    洗护
                </c:when>
                <c:when test="${goods.category=='jewellery'}">
                    珠宝
                </c:when>
                <c:when test="${goods.category=='fresh'}">
                    生鲜
                </c:when>
                <c:when test="${goods.category=='snacks'}">
                    零食
                </c:when>
            </c:choose>
        </td>
    </tr>
    <tr>
        <td class="info-table-first">
            销量：
        </td>
        <td>
            ${goods.sales}
        </td>
    </tr>
    <tr>
        <td class="info-table-first">
            库存：
        </td>
        <td>
            ${goods.stock}
        </td>
    </tr>
    <tr>
        <td class="info-table-first">
            描述：

        </td>
        <td class="table-description">
                ${goods.description}
        </td>
    </tr>
</table>
<div class="two-button">

    <a href="modifyGoods.jsp?id=${goods.id}" class="menu-link">
        <input type="submit" value="修改" class="login-button">
    </a>
    <a href="DeleteGoodsServlet?id=${goods.id}" class="menu-link">
        <input type="submit" value="删除" class="login-button">

    </a>
</div>
<h2>
     商品监控日志
</h2>
<div class="goodsRedcord">
    <table class="one-goods-record-table">
        <tr>
            <td>
                时间
            </td>
            <td>
                操作
            </td>
        </tr>
        <c:forEach items="${goodsRecord}" var="item">
            <tr>
                <td>
                        ${item.time}
                </td>
                <td>
                        ${item.userName}${item.operation}了该商品
                </td>
            </tr>
        </c:forEach>
    </table>

</div>
</body>
</html>
