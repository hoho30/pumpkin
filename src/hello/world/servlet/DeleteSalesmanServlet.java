package hello.world.servlet;

import hello.world.dao.RecordDao;
import hello.world.dao.SalesmanDao;
import hello.world.javaClass.Record;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DeleteSalesmanServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        SalesmanDao salesmanDao = new SalesmanDao();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
        String date=df.format(new Date());
        try{
            salesmanDao.deleteSalesman(request.getParameter("name"));
            Record record = new Record();
            record.setTime(date);
            record.setUsername("admin");
            record.setOperation(
                    "删除销售人员（" +
                            request.getParameter("name") +
                            ")");
            record.setIp(request.getRemoteAddr());
            RecordDao recordDao = new RecordDao();
            recordDao.insertRecord(record);
            response.sendRedirect(
                    "salesmanManage.jsp");

        }catch (SQLException e){
            e.printStackTrace();
        }
    }
}
