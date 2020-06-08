package hello.world.filter;

import hello.world.javaClass.User;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class LoginFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request=(HttpServletRequest)req;
        HttpServletResponse response=(HttpServletResponse)resp;
        if(request.getSession().getAttribute("user")==null&&
                !request.getRequestURI().equals("/pumpkin/index.jsp")&&
                !request.getRequestURI().equals("/pumpkin/login.jsp")&&
                !request.getRequestURI().equals("/pumpkin/logon.jsp")&&
                !request.getRequestURI().equals("/pumpkin/LogonServlet")&&
                !request.getRequestURI().equals("/pumpkin/LoginServlet")&&
                !request.getRequestURI().equals("/pumpkin/")&&
                !request.getRequestURI().equals("/pumpkin/css/index.css")&&
                !request.getRequestURI().startsWith("/pumpkin/graph/")&&
                !request.getRequestURI().equals("/pumpkin/salesmanLogin.jsp")&&
                !request.getRequestURI().equals("/pumpkin/SalesmanLoginServlet")&&
                !request.getRequestURI().equals("/pumpkin/goodsDetails.jsp")




        ){
//            System.out.println(request.getRequestURI());
            //response.sendRedirect("/login.jsp");
            response.setContentType("text/html;charset=utf-8");
            response.getWriter().write(
                    "<script >" +
                    "alert(\"请先登录\");" +
                    "location.href='/pumpkin/login.jsp';" +
                    "</script>");
        }else{
//            System.out.println(request.getRequestURI());
            chain.doFilter(req, resp);
        }

    }

    public void init(FilterConfig config) throws ServletException {

    }

}
