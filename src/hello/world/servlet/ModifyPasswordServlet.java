package hello.world.servlet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

public class ModifyPasswordServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        DBUtilsDao dbUtilsDao=new DBUtilsDao();
        User user=(User) request.getSession().getAttribute("user");
        String p1=request.getParameter("password1");
        String p2=request.getParameter("password2");
        if(!p1.equals(p2)){
            RequestDispatcher requestDispatcher=request.getRequestDispatcher("/modifyPassword.jsp");
            request.setAttribute("tips","两次密码不一致");
            requestDispatcher.forward(request,response);
            return;
        }
        if(p2.length()<6){
            RequestDispatcher dispatcher=request.getRequestDispatcher("/modifyPassword.jsp");
            request.setAttribute("tips","密码长度不足6位");
            dispatcher.forward(request,response);
            return;

        }
        user.setPassword(p1);
        try {
            dbUtilsDao.update(user);
        }catch (SQLException e){
            e.printStackTrace();
        }
        response.sendRedirect("/pumpkin/modifyUser.jsp");

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
