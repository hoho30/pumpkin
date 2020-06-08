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
    <title>添加商品</title>
    <style>
        #addGoods{
            background-color: #ff400b;
            color: white;
        }
    </style>
</head>
<body>
<%@ include file="header.jsp"%>
<%@ include file="menu.jsp"%>
<form action="AddGoodsServlet" method="post" enctype="multipart/form-data" class="add-goods">
    <table>
        <tr>
            <td>
                名称：
            </td>
            <td>
                <input type="text"  name="name">
            </td>
        </tr>
        <tr>
            <td>
                价格：
            </td>
            <td>
                <input type="text"  name="price">
            </td>
        </tr>
        <tr>
            <td>
                库存数量：
            </td>
            <td>
                <input type="text" name="stock"/>
            </td>
        </tr>
        <tr>
            <td>
                商品类型：

            </td>
            <td>
                <select name="category">
                    <option value="clothing">服装</option>
                    <option value="shoes">鞋靴</option>
                    <option value="digital">数码</option>
                    <option value="household">家电</option>
                    <option value="wash">洗护</option>
                    <option value="jewellery">珠宝</option>
                    <option value="fresh">生鲜</option>
                    <option value="snacks">零食</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>
                描述：
            </td>
            <td class="td-description">
                <textarea name="description" class="text-des"></textarea>
            </td>
        </tr>
        <tr>
            <td>
                上传图片：
            </td>
            <td >
                <div><input type="file" name="myFile" accept="image/*"></div>
            </td>
        </tr>
    </table>

    <input type="submit" value="确定" class="add-goods-button">
</form>
</body>
</html>
