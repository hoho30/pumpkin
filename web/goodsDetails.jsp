<%@ page import="hello.world.dao.DBUtilsDaoGoods" %>
<%@ page import="hello.world.javaClass.Goods" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="hello.world.dao.GoodsRecordDao" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="hello.world.javaClass.GoodsRecord" %><%--
  Created by IntelliJ IDEA.
  User: windows
  Date: 2020/5/26
  Time: 20:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>商品详情</title>
    <link rel="stylesheet" type="text/css" href="css/index.css">
</head>
<body>
<%@include file="header.jsp"%>
<%@ include file="menu.jsp"%>
<%
    DBUtilsDaoGoods dbUtilsDaoGoods = new DBUtilsDaoGoods();
    GoodsRecordDao goodsRecordDao = new GoodsRecordDao();
    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
    String date=df.format(new Date());
    String name=null;
    try {
        Goods goods = dbUtilsDaoGoods.find(Integer.parseInt(request.getParameter("id")));
        request.setAttribute("goods", goods);
        GoodsRecord goodsRecord = new GoodsRecord();
        goodsRecord.setTime(date);
        User user = (User)request.getSession().getAttribute("user");
        if(user!=null){
            goodsRecord.setUserName(user.getUsername());
            name=user.getUsername();

        }else{
            goodsRecord.setUserName("游客");

        }
        goodsRecord.setGoodsId(goods.getId());
        goodsRecord.setGoodsName(goods.getName());
        goodsRecord.setOperation("浏览");
        goodsRecord.setSalesmanName(goods.getSalesmanName());
        goodsRecordDao.insertGoodsRecord(goodsRecord);
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>
<div >
    <div class="detail-img">
        <img src="${goods.picture}" alt="${goods.name}"/>

    </div>
    <div class="details">
        <div>
            <h2>
                ${goods.name}

            </h2>
        </div>
        <div class="details-price">
            ￥
            ${goods.price}
        </div>

        <div class="description">${goods.description}</div>
        <div class="stock">库存：${goods.stock}</div>
        <div>
            <form action="AddCartServlet" method="post">
                <input type="hidden" name="id" value="${goods.id}">
                <input type="hidden" name="number" value="1">
                <input class="add-cart" type="submit" value="加入购物车" style="display: inline-block" onclick="addCart(this)">
                <div style="display: inline-block;color: #ff400b" ></div>
            </form>
        </div>
    </div>

    <div></div>
    <div></div>
    <div></div>
    <div></div>
    <div></div>

</div>

<script>
    function addCart(e) {
        e.nextElementSibling.innerHTML="已加入购物车";
    }
    window.onbeforeunload=function () {
        if(name!=null){
            let date1 = new Date("<%=date%>");
            let date2 = new Date();
            let time = date2-date1;
            let name= "<%=name%>";
            let xhttp = new XMLHttpRequest();
            xhttp.open("GET",
                "/pumpkin/InsertVisitGoodsDataServlet?datetime=<%=date%>&name="
                +
                name+
                "&id=${goods.id}&goodsName=${goods.name}&category=${goods.category}&time="+
                time
                ,true
            );
            xhttp.send();
        }
    }



</script>
</body>
</html>
