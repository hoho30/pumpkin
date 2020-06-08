package hello.world.servlet;

import hello.world.dao.RecordDao;
import hello.world.dao.SalesmanDao;
import hello.world.javaClass.Record;
import hello.world.javaClass.Salesman;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class UpdatePasswordServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Salesman salesman = new Salesman();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
        String date=df.format(new Date());
        SalesmanDao salesmanDao = new SalesmanDao();
        salesman.setName(request.getParameter("name"));
        String password1 = request.getParameter("password1");
        String password2 = request.getParameter("password2");
        response.setContentType("text/html;charset=utf-8");
        if(password1.equals(password2)){
            salesman.setPassword(password1);
            try{
                salesmanDao.updateSalesman(salesman);
                Record record = new Record();
                record.setTime(date);
                record.setUsername("admin");
                record.setOperation(
                        "修改销售人员密码（" +
                                salesman.getName() +
                                ")");
                record.setIp(request.getRemoteAddr());
                RecordDao recordDao = new RecordDao();
                recordDao.insertRecord(record);
                response.getWriter().write("<script>" +
                        "alert('修改成功！');" +
                        "location.href='salesmanManage.jsp';" +
                        "</script>");

            }catch (SQLException e){
                e.printStackTrace();
            }

        }else{
            RequestDispatcher requestDispatcher=request.getRequestDispatcher(
                    "updatePassword.jsp?name=" +
                    salesman.getName());
            request.setAttribute("tips","两次密码不一致");
            requestDispatcher.forward(request,response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
