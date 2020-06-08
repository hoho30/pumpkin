package hello.world.servlet;

import hello.world.dao.DBUtilsDao;
import hello.world.dao.LoginDataDao;
import hello.world.dao.RecordDao;
import hello.world.javaClass.LoginData;
import hello.world.javaClass.User;

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
        request.setCharacterEncoding("utf-8");
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
        String date=df.format(new Date());
        User user=new User();
        user.setUsername(request.getParameter("username"));
        user.setPassword(request.getParameter("password"));
        try{
            if(dao.find(user.getUsername())==null){
                RequestDispatcher dispatcher=request.getRequestDispatcher("login.jsp");
                request.setAttribute("tips","用户名或密码错误");
                dispatcher.forward(request,response);
                return;
            }
            if(!dao.find(user.getUsername()).getPassword().equals(user.getPassword())){
                RequestDispatcher dispatcher=request.getRequestDispatcher("login.jsp");
                request.setAttribute("tips","用户名或密码错误");
                dispatcher.forward(request,response);
                return;
            }
            else{
                System.out.println(user.getUsername());
                user=dao.find(user.getUsername());
                System.out.println(user.getUsername());
                request.getSession().setAttribute("user",user);
                System.out.println(
                        "ip:"+request.getRemoteAddr()
                );
                LoginDataDao loginDataDao = new LoginDataDao();
                LoginData loginData = new LoginData();
                loginData.setName("用户："+user.getUsername());
                loginData.setTime(date);
                loginData.setIp(request.getRemoteAddr());
                loginData.setOperation("登陆");
                loginDataDao.insertLoginData(loginData);
                String autoLogin = request.getParameter("autoLogin");
                if (autoLogin!=null){
                    Cookie cookie=new Cookie("autoLogin",
                            user.getUsername()+"-"+user.getPassword());
                    cookie.setMaxAge(Integer.parseInt(autoLogin));
                    cookie.setPath("/");
                    response.addCookie(cookie);
                }
                if(!user.getUsername().equals("admin")){
                    response.sendRedirect("index.jsp");
                }
                else response.sendRedirect("salesmanManage.jsp");


            }
        }catch (SQLException e){
            e.printStackTrace();

        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
