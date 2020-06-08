<%@ page import="hello.world.dao.DBUtilsDaoGoods" %>
<%@ page import="hello.world.javaClass.Goods" %>
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
    <title>修改商品信息</title>
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

        <div><input name="salesmanName" value="${goods.salesmanName}" type="hidden"> </div>
        <table>
            <tr>
                <td>
                    id：
                </td>
                <td>
                    ${goods.id}
                    <input name="gid" type="hidden" value="${goods.id}">
                </td>
            </tr>
            <tr>
                <td>
                    名称：
                </td>
                <td>
                    <input type="text" value="${goods.name}" name="name">
                </td>
            </tr>
            <tr>
                <td>
                    价格：
                </td>
                <td>
                    <input type="text" value="${goods.price}" name="price">
                </td>
            </tr>
            <tr>
                <td>
                    商品类型：
                </td>
                <td>
                    <select name="category">
                        <c:choose>
                            <c:when test="${goods.category=='clothing'}">
                                <option value="clothing" selected="selected">服装</option>
                            </c:when>
                            <c:otherwise>
                                <option value="clothing">服装</option>
                            </c:otherwise>
                        </c:choose>
                        <c:choose>
                            <c:when test="${goods.category=='shoes'}">
                                <option value="shoes" selected="selected">鞋靴</option>
                            </c:when>
                            <c:otherwise>
                                <option value="shoes">鞋靴</option>
                            </c:otherwise>
                        </c:choose>
                        <c:choose>
                            <c:when test="${goods.category=='digital'}">
                                <option value="digital" selected="selected">数码</option>
                            </c:when>
                            <c:otherwise>
                                <option value="digital">数码</option>
                            </c:otherwise>
                        </c:choose>
                        <c:choose>
                            <c:when test="${goods.category=='household'}">
                                <option value="household" selected="selected">家电</option>
                            </c:when>
                            <c:otherwise>
                                <option value="household">家电</option>
                            </c:otherwise>
                        </c:choose>
                        <c:choose>
                            <c:when test="${goods.category=='wash'}">
                                <option value="wash" selected="selected">洗护</option>
                            </c:when>
                            <c:otherwise>
                                <option value="wash">洗护</option>
                            </c:otherwise>
                        </c:choose>
                        <c:choose>
                            <c:when test="${goods.category=='jewellery'}">
                                <option value="jewellery" selected="selected">珠宝</option>
                            </c:when>
                            <c:otherwise>
                                <option value="jewellery">珠宝</option>
                            </c:otherwise>
                        </c:choose>
                        <c:choose>
                            <c:when test="${goods.category=='fresh'}">
                                <option value="fresh" selected="selected">生鲜</option>
                            </c:when>
                            <c:otherwise>
                                <option value="fresh">生鲜</option>
                            </c:otherwise>
                        </c:choose>
                        <c:choose>
                            <c:when test="${goods.category=='snacks'}">
                                <option value="snacks" selected="selected">零食</option>
                            </c:when>
                            <c:otherwise>
                                <option value="snacks">零食</option>
                            </c:otherwise>
                        </c:choose>
                    </select>
                </td>
            </tr>
            <tr>
                <td>
                    商品库存：
                </td>
                <td>
                    <input type="text" value="${goods.stock}" name="stock">
                </td>
            </tr>
            <tr>
                <td>
                    描述：
                </td>
                <td>
                    <textarea name="description" class="text-des">${goods.description}</textarea>
                </td>
            </tr>
            <tr>
                <td>
                    上传图片：
                </td>
                <td>
                    <input type="file" name="myFile" accept="image/*">
                </td>
            </tr>
        </table>
        <input type="hidden" name="picture" value="${goods.picture}">
        <input type="submit" value="确定" formaction="UploadServlet">
        <input type="submit" value="返回">

    </div>


    <%--    <input type="submit" formaction="goodsManage.jsp" value="返回">--%>
</form>

</body>
</html>
