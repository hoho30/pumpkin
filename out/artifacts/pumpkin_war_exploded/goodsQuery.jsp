<%@ page import="hello.world.dao.DBUtilsDaoGoods" %>
<%@ page import="java.util.List" %>
<%@ page import="hello.world.javaClass.Goods" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.Comparator" %><%--
  Created by IntelliJ IDEA.
  User: windows
  Date: 2020/5/30
  Time: 12:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>
<head>
    <title>所有商品管理</title>
    <link rel="stylesheet" type="text/css" href="css/index.css">
    <style type="text/css">

        #goodsQuery{
            background-color: #ff400b;
            color: white;
        }
    </style>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="menu.jsp" %>
<%
    DBUtilsDaoGoods dbUtilsDaoGoods = new DBUtilsDaoGoods();
    try{
        List<Goods> list = dbUtilsDaoGoods.findAll();
        request.setAttribute("salesman",request.getParameter("salesman"));
        String compare = request.getParameter("compare");
        if(compare!=null){
            switch (compare){
                case "sales":
                    list.sort(new Comparator<Goods>() {
                        @Override
                        public int compare(Goods o1, Goods o2) {
                            return o2.getSales()-o1.getSales();
                        }
                    });break;
                case "salesVol":
                    list.sort(new Comparator<Goods>() {
                        @Override
                        public int compare(Goods o1, Goods o2) {
                            return (int)(o2.getSales()*o2.getPrice()-
                                    o1.getSales()*o1.getPrice());
                        }
                    });
            }
        }
        request.setAttribute("goodsList",list);

    }catch (SQLException e){
        e.printStackTrace();
    }

%>
<table class="all-goods-record">
    <tr class="first">
        <td>
            id
        </td>
        <td>
            名称
        </td>
        <td>
            库存
        </td>
        <td>
            <a  class="common-link" href="goodsQuery.jsp?salesman=${salesman}&compare=sales">
                销量
            </a>

        </td>
        <td>
            <a class="common-link"  href="goodsQuery.jsp?salesman=${salesman}&compare=salesVol">
                销售额
            </a>
        </td>
        <td>
            负责人
        </td>
    </tr>
    <c:forEach items="${goodsList}" var="item">
        <c:if test="${salesman==item.salesmanName||salesman=='admin'}">
            <tr>
                <td>
                        ${item.id}
                </td>
                <td>
                    <a  class="common-link" href="goodsInformation.jsp?id=${item.id}" target="_blank">
                            ${item.name}
                    </a>
                </td>
                <td>
                        ${item.stock}
                </td>
                <td>
                        ${item.sales}
                </td>
                <td>
                    <fmt:formatNumber value="${item.sales*item.price}" type="currency" pattern=".00"/>
                </td>
                <td>
                        ${item.salesmanName}
                </td>
            </tr>
        </c:if>
    </c:forEach>
</table>

</body>
</html>
