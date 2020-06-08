<%@ page import="java.sql.SQLException" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="hello.world.servlet.*" %>
<%@ page import="hello.world.dao.DBUtilsDaoGoods" %>
<%@ page import="hello.world.javaClass.Goods" %>
<%@ page import="java.util.*" %>
<%@ page import="hello.world.javaClass.Persona" %><%--
  Created by IntelliJ IDEA.
  User: hoho
  Date: 2019/12/2
  Time: 21:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if (request.getSession().getAttribute("user") != null &&
            (((User) request.getSession().getAttribute("user")).getUsername()).equals("admin")) {
        response.sendRedirect("/pumpkin/goodsManage.jsp");
    }

    DBUtilsDaoGoods dao = new DBUtilsDaoGoods();
    try {
        List<Goods> list = dao.findAll();
        if(request.getParameter("search")!=null){
//            System.out.println("search:"+request.getParameter("search"));
            request.setAttribute("search",request.getParameter("search"));
            Iterator<Goods> iterator=list.iterator();
            while(iterator.hasNext()){
                Goods item=iterator.next();
                if(item.getName().indexOf(request.getParameter("search"))==-1){
                    iterator.remove();
                }
            }
        }
        User user = (User)request.getSession().getAttribute("user");
        final Map<String,Integer> categoryInt = new HashMap<>();
        categoryInt.put("clothing",0);
        categoryInt.put("shoes",1);
        categoryInt.put("digital",2);
        categoryInt.put("household",3);
        categoryInt.put("wash",4);
        categoryInt.put("jewellery",5);
        categoryInt.put("fresh",6);
        categoryInt.put("snacks",7);
        if(request.getSession().getAttribute("user")!=null){
            final Persona persona = new Persona(user.getUsername());
            list.sort(new Comparator<Goods>() {
                @Override
                public int compare(Goods o1, Goods o2) {
                    int o1Int,o2Int;
                    o1Int = persona.getPersona()[categoryInt.get(o1.getCategory())];
                    o2Int = persona.getPersona()[categoryInt.get(o2.getCategory())];
                    return -(o1Int-o2Int);
                }
            });
        }else {
            final Persona persona = new Persona("");
            list.sort(new Comparator<Goods>() {
                @Override
                public int compare(Goods o1, Goods o2) {
                    int o1Int,o2Int;
                    o1Int = persona.getPersona()[categoryInt.get(o1.getCategory())];
                    o2Int = persona.getPersona()[categoryInt.get(o2.getCategory())];
                    return -(o1Int-o2Int);
                }
            });
        }
        request.setAttribute("goodsList", list);
    } catch (SQLException e) {
        e.printStackTrace();
    }
    String category=request.getParameter("category");//获取category参数
    request.setAttribute("category",category);//写进request参数中
%>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="css/index.css">
    <title>南瓜网首页</title>
    <style>
        #allGoods {
            background-color: #ff400b;
            color: white;
        }
    </style>

</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="menu.jsp" %>
<div>
    <a href="index.jsp?category=clothing" class="common-link category">
        服装
    </a>
    <a href="index.jsp?category=shoes" class="common-link category">
        鞋靴
    </a>
    <a href="index.jsp?category=digital" class="common-link category">
        数码
    </a>
    <a href="index.jsp?category=household" class="common-link category">
        家电
    </a>
    <a href="index.jsp?category=wash" class="common-link category">
        洗护
    </a>
    <a href="index.jsp?category=jewellery" class="common-link category">
        珠宝
    </a>
    <a href="index.jsp?category=fresh" class="common-link category">
        生鲜
    </a>
    <a href="index.jsp?category=snacks" class="common-link category">
        零食
    </a>
</div>
<%--<p>${category}</p>--%>
<c:forEach items="${goodsList}" var="i">
    <c:if test="${i.category==category||category==null}" >
        <div class="goods" id="${i.id}">

            <div>
                <a href="goodsDetails.jsp?id=${i.id}" target="_blank">
                    <img src="${i.picture}" alt="${i.name}">
                </a>
            </div>
            <div class="price">￥${i.price}</div>
            <div class="name">
                <a href="goodsDetails.jsp?id=${i.id}" target="_blank" class="common-link">
                        ${i.name}
                </a>
            </div>
<%--            <div class="des">${i.description}</div>--%>
<%--            <div>--%>
<%--                <form action="AddCartServlet" method="post">--%>
<%--                    <input type="hidden" name="id" value="${i.id}">--%>
<%--                    <input type="hidden" name="number" value="1">--%>
<%--                    <input type="submit" value="加入购物车" style="display: inline-block" onclick="addCart(this)">--%>
<%--                    <div style="display: inline-block;color: #ff400b" ></div>--%>
<%--                </form>--%>
<%--            </div>--%>
        </div>
    </c:if>
</c:forEach>
<%--<script>--%>
<%--function addCart(e) {--%>
<%--    e.nextElementSibling.innerHTML="已加入购物车";--%>
<%--}--%>
<%--</script>--%>
</body>
</html>
