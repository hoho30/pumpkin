<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="hello.world.javaClass.User" %>
<%@ page import="hello.world.javaClass.Salesman" %><%--
  Created by IntelliJ IDEA.
  User: hoho
  Date: 2019/12/4
  Time: 14:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if (request.getSession().getAttribute("user")!=null)
        if(request.getSession().getAttribute("user").getClass().
                equals(User.class)){
            User user1=(User)request.getSession().getAttribute("user");
            request.setAttribute("name",user1.getUsername());
            request.setAttribute("isSalesman",false);

        }else if(request.getSession().getAttribute("user").getClass().
                equals(Salesman.class)){
            Salesman user1 = (Salesman)request.getSession().getAttribute("user");
            request.setAttribute("name",user1.getName());
            request.setAttribute("isSalesman",true);

        }

%>
<html>
<head>
    <title>头部</title>
    <style>
        #header button{
            margin: 0;
        }
    </style>
</head>
<body>

<div id="header" >
    <c:choose>
        <c:when test="${name==null}"><a href="login.jsp" class="common-link">请登录</a> </c:when>
        <c:otherwise>
            ${name}，欢迎您&nbsp
            <c:if test="${!isSalesman&&name!='admin'}">
                <a href="modifyUser.jsp" class="common-link">
                        账号管理
                </a>
            </c:if>
             &nbsp;&nbsp;
            <a href="LogoutServlet" class="common-link">
                    退出
            </a>
        </c:otherwise>
    </c:choose>
</div>
<div class="title">
    <div  id="logo" >

        <c:choose>
            <c:when test="${isSalesman}">
                <a href="goodsManage.jsp">
                    <img alt="logo" src="graph/logo.png"/>
                </a>
            </c:when>
            <c:otherwise>
                <a href="index.jsp">
                    <img alt="logo" src="graph/logo.png"/>
                </a>
            </c:otherwise>
        </c:choose>
    </div>
    <c:choose>
        <c:when test="${name!=null}">
            <c:choose>
                <c:when test="${isSalesman}">
                    <div class="title-words">
                        <h1>
                            销售人员系统
                        </h1>
                    </div>

                </c:when>
                <c:otherwise>
                    <c:choose>
                        <c:when test="${name=='admin'}">
                            <div class="title-words">
                                <h1>
                                    管理员系统
                                </h1>
                            </div>

                        </c:when>
                        <c:otherwise>
                            <div class="search">
                                <form action="index.jsp" method="get">
                                    <input type="text" value="${search}" name="search" >
                                    <input type="submit" value="搜索">
                                </form>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </c:otherwise>
            </c:choose>
        </c:when>
        <c:otherwise>
            <div class="search">
                <form action="index.jsp" method="get">
                    <input type="text" value="${search}" name="search" >
                    <input type="submit" value="搜索">
                </form>
            </div>
        </c:otherwise>
    </c:choose>

</div>

<div></div>

</body>
</html>
