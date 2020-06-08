package hello.world.servlet;

import hello.world.dao.DBUtilsDaoGoods;
import hello.world.dao.RecordDao;
import hello.world.javaClass.Record;
import hello.world.javaClass.Salesman;
import hello.world.javaClass.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DeleteGoodsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        DBUtilsDaoGoods dao=new DBUtilsDaoGoods();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
        String date=df.format(new Date());
        try{
            dao.delete(Integer.parseInt(request.getParameter("id")));

        }catch (SQLException e){
            e.printStackTrace();
        }
        Record record = new Record();
        record.setTime(date);
        if(request.getSession().getAttribute("user").getClass().equals(User.class)){
            User user = (User)request.getSession().getAttribute("user");
            record.setUsername(user.getUsername());
        }else {
            Salesman salesman = (Salesman)request.getSession().getAttribute("user");
            record.setUsername(salesman.getName());
        }
        record.setOperation(
                "删除商品（商品号：" +
                        request.getParameter("id") +
                        ")");
        record.setIp(request.getRemoteAddr());
        RecordDao recordDao = new RecordDao();
        try{
            recordDao.insertRecord(record);

        }catch (SQLException e){
            e.printStackTrace();
        }
        response.sendRedirect("goodsManage.jsp");

    }
}
