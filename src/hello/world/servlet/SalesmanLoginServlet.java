package hello.world.servlet;

import hello.world.dao.LoginDataDao;
import hello.world.dao.SalesmanDao;
import hello.world.javaClass.LoginData;
import hello.world.javaClass.Salesman;

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

public class SalesmanLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
        String date=df.format(new Date());
        SalesmanDao salesmanDao = new SalesmanDao();
        Salesman salesman = new Salesman();
        salesman.setName(request.getParameter("username"));
        salesman.setPassword(request.getParameter("password"));
        try{
            if(salesmanDao.findSalesman(salesman.getName())==null){
                RequestDispatcher dispatcher=request.getRequestDispatcher("salesmanLogin.jsp");
                request.setAttribute("tips","用户名或密码错误");
                dispatcher.forward(request,response);
                return;
            }
            if(!salesmanDao.findSalesman(salesman.getName()).getPassword().equals(salesman.getPassword())){
                RequestDispatcher dispatcher=request.getRequestDispatcher("salesmanLogin.jsp");
                request.setAttribute("tips","用户名或密码错误");
                dispatcher.forward(request,response);
                return;
            }
            else{
//                System.out.println(salesman.getName());
//                user=dao.find(user.getUsername());
//                System.out.println(user.getUsername());
                LoginDataDao loginDataDao = new LoginDataDao();
                LoginData loginData = new LoginData();
                loginData.setName("销售人员："+salesman.getName());
                loginData.setTime(date);
                loginData.setIp(request.getRemoteAddr());
                loginData.setOperation("登陆");
                loginDataDao.insertLoginData(loginData);
                request.getSession().setAttribute("user",salesman);
                System.out.println(
                        "ip:"+request.getRemoteAddr()
                );
//                recordDao.insertRecord(date,user.getUsername(),"登陆了商城",request.getRemoteAddr());

//                String autoLogin = request.getParameter("autoLogin");
//                if (autoLogin!=null){
//                    Cookie cookie=new Cookie("autoLogin",
//                            user.getUsername()+"-"+user.getPassword());
//                    cookie.setMaxAge(Integer.parseInt(autoLogin));
//                    cookie.setPath("/");
//                    response.addCookie(cookie);
//                }
                response.sendRedirect("goodsManage.jsp");


            }
        }catch (SQLException e){
            e.printStackTrace();

        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
