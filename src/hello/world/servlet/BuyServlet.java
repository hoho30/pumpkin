package hello.world.servlet;

import hello.world.dao.*;
import hello.world.javaClass.*;

import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
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
                System.out.println("检查date变量："+date);
                dao.insertOrders(user.getUsername(),date);
                int orderId=dao.findOrderId(user.getUsername(),date);

                Iterator<Map.Entry<Goods,Integer>> it=cart.entrySet().iterator();
                int fullSize=cart.size();
                while (it.hasNext()) {
                    Map.Entry<Goods, Integer> entry = it.next();
                    int stock=dbUtilsDaoGoods.viewStock(entry.getKey().getId());
                    if(entry.getValue()<=stock){//判断库存是否充足
                        dbUtilsDaoGoods.buyGoods(entry.getValue(),entry.getKey().getId());
                        it.remove();
                        dao.insertOrder_Goods(orderId,entry.getKey().getId(), entry.getValue(),
                                entry.getKey().getName(),entry.getKey().getPrice());//加入订单数据
                        dbUtilsDaoGoods.addSales(entry.getKey().getId(),entry.getValue());//增加销量
//                        RecordDao recordDao=new RecordDao();
//                        recordDao.insertRecord(date,user.getUsername(),"购买了"+entry.getValue()+
//                                "件id为"+entry.getKey().getId()+"商品名为“"+entry.getKey().getName()+
//                                "”的商品",request.getRemoteAddr());
                        GoodsRecordDao goodsRecordDao = new GoodsRecordDao();//添加商品记录
                        GoodsRecord goodsRecord = new GoodsRecord();
                        goodsRecord.setTime(date);
                        goodsRecord.setUserName(user.getUsername());
                        goodsRecord.setGoodsId(entry.getKey().getId());
                        goodsRecord.setGoodsName(entry.getKey().getName());
                        goodsRecord.setOperation("购买");
                        goodsRecord.setSalesmanName(entry.getKey().getSalesmanName());
                        goodsRecordDao.insertGoodsRecord(goodsRecord);

                        BuyGoodsData buyGoodsData = new BuyGoodsData();
                        buyGoodsData.setTime(date);
                        buyGoodsData.setName(user.getUsername());
                        buyGoodsData.setId(entry.getKey().getId());
                        buyGoodsData.setGoodsName(entry.getKey().getName());
                        buyGoodsData.setCategory(entry.getKey().getCategory());
                        buyGoodsData.setPrice(entry.getKey().getPrice());
                        buyGoodsData.setNumber(entry.getValue());
                        BuyGoodsDataDao buyGoodsDataDao = new BuyGoodsDataDao();
                        buyGoodsDataDao.insertBuyGoodsData(buyGoodsData);

                    }

                }
//                for(Map.Entry<Goods,Integer> entry:cart.entrySet()){
//                    int stock=dbUtilsDaoGoods.viewStock(entry.getKey().getId());
//                    if(entry.getValue()>=stock){
//                        dbUtilsDaoGoods.buyGoods(entry.getValue(),entry.getKey().getId());
//                        dao.insertOrder_Goods(orderId,entry.getKey().getId(), entry.getValue(),
//                                entry.getKey().getName(),entry.getKey().getPrice());//加入订单数据
//                        dbUtilsDaoGoods.addSales(entry.getKey().getId(),entry.getValue());//增加销量
//                        RecordDao recordDao=new RecordDao();
//                        recordDao.insertRecord(date,user.getUsername(),"购买了"+entry.getValue()+
//                                "件id为"+entry.getKey().getId()+"商品名为“"+entry.getKey().getName()+
//                                "”的商品",request.getRemoteAddr());
//                    }else{
//                        defeatNumbers++;
//                    }
//
//                }
                response.setContentType("text/html;charset=utf-8");
                if(cart.size()<=0){
                    request.getSession().removeAttribute("cart");
                    MailUtils.sendMail(user.getEmail(),"您的订单号为"+orderId+"的订单已发货。");
                    response.getWriter().write("<script>" +
                            "alert('您已成功下单，订单已发货，请查看邮件');" +
                            "location.href='cart.jsp';" +
                            "</script>");
                }else {
                    if(cart.size()<fullSize){
                        MailUtils.sendMail(user.getEmail(),"您的订单号为"+orderId+"的订单已发货。");
                        response.getWriter().write("<script>" +
                                "alert('您的订单中有" +
                                cart.size() +
                                "件商品因库存不足而下单失败，其余商品已发货，请留意邮件');" +
                                "location.href='cart.jsp';" +
                                "</script>");
                    }
                    else {
                        response.getWriter().write("<script>" +
                                "alert('您的订单中有" +
                                cart.size() +
                                "件商品因库存不足而下单失败');" +
                                "location.href='cart.jsp';" +
                                "</script>");
                    }

                }

            }
//            System.out.println(
//                    user.getEmail()
//            );


        }catch (SQLException e){
            e.printStackTrace();
        }catch (MessagingException e){
            if(request.getSession().getAttribute("cart")==null){
                response.getWriter().write("<script>" +
                        "alert('您已成功下单，但发送邮件失败，请检查邮箱地址是否正确');" +
                        "location.href='/pumpkin/cart.jsp';" +
                        "</script>");
            }else{
                response.getWriter().write("<script>" +
                        "alert('您的订单中有" +
                        cart.size() +
                        "件商品因库存不足而下单失败，其余商品已发货，但发送邮件失败，请检查邮箱地址是否正确');" +
                        "location.href='/pumpkin/cart.jsp';" +
                        "</script>");
            }

        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
