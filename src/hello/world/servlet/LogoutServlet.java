package hello.world.servlet;

import hello.world.dao.LoginDataDao;
import hello.world.javaClass.LoginData;
import hello.world.javaClass.Salesman;
import hello.world.javaClass.User;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class LogoutServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        LoginData loginData = new LoginData();
        if (request.getSession().getAttribute("user").getClass().equals(User.class)){
            User user = (User)request.getSession().getAttribute("user");
            loginData.setName("用户："+user.getUsername());
        }else{
            Salesman salesman = (Salesman)request.getSession().getAttribute("user");
            loginData.setName("销售人员："+salesman.getName());
        }
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
        String date=df.format(new Date());
        request.getSession().removeAttribute("user");
        Cookie cookie=new Cookie("autoLogin","msg" );
        cookie.setPath("/");
        cookie.setMaxAge(0);
        response.addCookie(cookie);
        response.sendRedirect("index.jsp");
        LoginDataDao loginDataDao = new LoginDataDao();
        loginData.setTime(date);
        loginData.setIp(request.getRemoteAddr());
        loginData.setOperation("登出");
        try {
            loginDataDao.insertLoginData(loginData);

        }catch (SQLException e){
            e.printStackTrace();
        }

    }
}
