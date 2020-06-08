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

public class AddSalesmanServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        SalesmanDao salesmanDao = new SalesmanDao();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
        String date=df.format(new Date());
        Salesman salesman = new Salesman();
        salesman.setName(request.getParameter("name"));
        salesman.setPassword(request.getParameter("p1"));
        String p2 = request.getParameter("p2");

        try{
            if(salesman.getName().length()<5){
                RequestDispatcher dispatcher=request.getRequestDispatcher("addSalesman.jsp");
                request.setAttribute("tips","用户名长度不足5位");
                dispatcher.forward(request,response);
                return;
            }
            if(salesmanDao.findSalesman(salesman.getName())!=null){
                RequestDispatcher dispatcher=request.getRequestDispatcher("addSalesman.jsp");
                request.setAttribute("tips","用户名重复");
                dispatcher.forward(request,response);
                return;
            }

            if(p2.length()<6){
                RequestDispatcher dispatcher=request.getRequestDispatcher("addSalesman.jsp");
                request.setAttribute("tips","密码长度不足6位");
                dispatcher.forward(request,response);
                return;
            }
            if(!p2.equals(salesman.getPassword())){
                RequestDispatcher dispatcher=request.getRequestDispatcher("addSalesman.jsp");
                request.setAttribute("tips","两次输入的密码不一样");
                dispatcher.forward(request,response);
                return;
            }
            salesmanDao.insertSalesman(salesman);
            Record record = new Record();
            record.setTime(date);
            record.setUsername("admin");
            record.setOperation(
                    "添加销售人员（" +
                            salesman.getName() +
                            ")");
            record.setIp(request.getRemoteAddr());
            RecordDao recordDao = new RecordDao();
            recordDao.insertRecord(record);
            response.setContentType("text/html;charset=utf-8");
            response.getWriter().write("<script>" +
                    "alert('添加成功！');" +
                    "location.href='salesmanManage.jsp';" +
                    "</script>");
        }
        catch(SQLException e){
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
