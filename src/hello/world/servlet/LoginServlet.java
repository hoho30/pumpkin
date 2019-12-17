package hello.world.servlet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class LoginServlet extends HttpServlet {
    private static DBUtilsDao dao=new DBUtilsDao();
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
        String date=df.format(new Date());
        RecordDao recordDao=new RecordDao();
        User user=new User();
        user.setUsername(request.getParameter("username"));
        user.setPassword(request.getParameter("password"));
        try{
            if(dao.find(user.getUsername())==null){
                RequestDispatcher dispatcher=request.getRequestDispatcher("/login.jsp");
                request.setAttribute("tips","用户名或密码错误");
                dispatcher.forward(request,response);
                return;
            }
            if(!dao.find(user.getUsername()).getPassword().equals(user.getPassword())){
                RequestDispatcher dispatcher=request.getRequestDispatcher("/login.jsp");
                request.setAttribute("tips","用户名或密码错误");
                dispatcher.forward(request,response);
                return;
            }
            else{
                System.out.println(user.getUsername());
                user=dao.find(user.getUsername());
                System.out.println(user.getUsername());
                request.getSession().setAttribute("user",user);
                recordDao.insertRecord(date,user.getUsername(),"登陆了商城",request.getRemoteAddr());

                String autoLogin = request.getParameter("autoLogin");
                if (autoLogin!=null){
                    Cookie cookie=new Cookie("autoLogin",
                            user.getUsername()+"-"+user.getPassword());
                    cookie.setMaxAge(Integer.parseInt(autoLogin));
                    cookie.setPath("/");
                    response.addCookie(cookie);
                }
                if(user.getUsername().equals("admin")==false){
                    response.sendRedirect("/pumpkin/index.jsp");
                }
                else response.sendRedirect("/pumpkin/goodsManage.jsp");


            }
        }catch (SQLException e){
            e.printStackTrace();

        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
