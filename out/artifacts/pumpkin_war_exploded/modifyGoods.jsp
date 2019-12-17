<%@ page import="hello.world.servlet.DBUtilsDaoGoods" %>
<%@ page import="hello.world.servlet.Goods" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: hoho
  Date: 2019/12/14
  Time: 20:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    DBUtilsDaoGoods dao = new DBUtilsDaoGoods();
    try {
        Goods goods = dao.find(Integer.parseInt(request.getParameter("id")));
        request.setAttribute("goods", goods);
    } catch (SQLException e) {
        e.printStackTrace();
    }


%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="css/index.css">
</head>
<script>
    function ClickId(e) {
        alert("商品id不能修改哦");
    }
</script>
<body>
<%@ include file="header.jsp" %>
<br/>
<%@ include file="menu.jsp" %>
<form action="goodsManage.jsp" method="post" enctype="multipart/form-data">
    <div id="moImg"><img src="${goods.picture}" alt="${goods.name}"></div>
    <div id="moInput">
        <div>&emsp;id：<input name="gid" readonly="readonly" type="text" value="${goods.id}" onclick="ClickId()"></div>
        <div>名称：<input type="text" value="${goods.name}" name="name"></div>
        <div>价格：<input type="text" value="${goods.price}" name="price"></div>
        <div class="moDes">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;描述：<textarea
                name="description">${goods.description}</textarea>
        </div>
        <input type="hidden" name="picture" value="${goods.picture}">
        <div><input type="file" name="myFile" accept="image/*"></div>
        <input type="submit" value="确定" formaction="UploadServlet">
        <button>返回</button>

    </div>


    <%--    <input type="submit" formaction="goodsManage.jsp" value="返回">--%>
</form>

</body>
</html>
