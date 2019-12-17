<%--
  Created by IntelliJ IDEA.
  User: hoho
  Date: 2019/12/15
  Time: 2:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="css/index.css">
    <title>Title</title>
    <style>
        #addGoods{
            background-color: #ff400b;
            color: white;
        }
    </style>
</head>
<body>
<%@ include file="header.jsp"%><br/>
<%@ include file="menu.jsp"%>
<form action="AddGoodsServlet" method="post" enctype="multipart/form-data">
    <div>名称：<input type="text"  name="name"></div>
    <div>价格：<input type="text"  name="price"></div>
    <div class="moDes">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;描述：<textarea
            name="description">${goods.description}</textarea>
    </div>
    <div><input type="file" name="myFile" accept="image/*"></div>
    <input type="submit" value="确定">
</form>
</body>
</html>
