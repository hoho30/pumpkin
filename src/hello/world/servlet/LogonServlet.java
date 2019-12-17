package hello.world.servlet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

public class LogonServlet extends HttpServlet {
    private static DBUtilsDao dao=new DBUtilsDao();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        User user=new User();
        user.setUsername(request.getParameter("username"));
        user.setPassword(request.getParameter("password"));
        user.setEmail(request.getParameter("email"));
        String p2=request.getParameter("password_s");
        try{
            if(user.getUsername().length()<5){
            RequestDispatcher dispatcher=request.getRequestDispatcher("/logon.jsp");
            request.setAttribute("tips","用户名长度不足5位");
            dispatcher.forward(request,response);
            return;
            }
            if(user.getEmail()==null||user.getEmail().equals("")){
                RequestDispatcher dispatcher=request.getRequestDispatcher("/logon.jsp");
                request.setAttribute("tips","邮箱不能为空");
                dispatcher.forward(request,response);
                return;
            }
            if(!p2.equals(user.getPassword())){
                RequestDispatcher dispatcher=request.getRequestDispatcher("/logon.jsp");
                request.setAttribute("tips","两次输入的密码不一样");
                dispatcher.forward(request,response);
                return;
            }
            if(p2.length()<6){
                RequestDispatcher dispatcher=request.getRequestDispatcher("/logon.jsp");
                request.setAttribute("tips","密码长度不足6位");
                dispatcher.forward(request,response);
                return;
            }
            if(dao.find(user.getUsername())!=null){
                RequestDispatcher dispatcher=request.getRequestDispatcher("/logon.jsp");
                request.setAttribute("tips","用户名重复");
                dispatcher.forward(request,response);
                return;
            }
            dao.insert(user);
            response.sendRedirect("/pumpkin/login.jsp");}
        catch(SQLException e){
        }


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
