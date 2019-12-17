package hello.world.servlet;

import javax.mail.MessageRemovedException;
import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

public class BuyServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        OrderDao dao=new OrderDao();
        DBUtilsDaoGoods dbUtilsDaoGoods=new DBUtilsDaoGoods();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
        String date=df.format(new Date());
        Map<Goods,Integer> cart=(Map<Goods,Integer>)request.getSession().getAttribute("cart");
        User user=(User)request.getSession().getAttribute("user");
        try{
            if(cart!=null){
                dao.insertOrders(user.getUsername(),date);
                int orderId=dao.findOrderId(user.getUsername(),date);
                for(Map.Entry<Goods,Integer> entry:cart.entrySet()){
                    dao.insertOrder_Goods(orderId,entry.getKey().getId(), entry.getValue(),
                            entry.getKey().getName(),entry.getKey().getPrice());
                    dbUtilsDaoGoods.addSales(entry.getKey().getId(),entry.getValue());
                    RecordDao recordDao=new RecordDao();
                    recordDao.insertRecord(date,user.getUsername(),"购买了"+entry.getValue()+
                            "件id为"+entry.getKey().getId()+"商品名为“"+entry.getKey().getName()+
                            "”的商品",request.getRemoteAddr());
                }
                request.getSession().removeAttribute("cart");
                MailUtils.sendMail(user.getEmail(),"您的订单号为"+orderId+"的订单已发货。");
            }
            System.out.println(
                    user.getEmail()
            );


            response.getWriter().write("<script>" +
                    "alert('您已成功下单，订单发货后将以邮件通知您');" +
                    "location.href='/pumpkin/cart.jsp';" +
                    "</script>");
        }catch (SQLException e){
            e.printStackTrace();
        }catch (MessagingException e){
            response.getWriter().write("<script>" +
                    "alert('发送邮件失败，请检查邮箱地址是否正确');" +
                    "location.href='/pumpkin/cart.jsp';" +
                    "</script>");
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
