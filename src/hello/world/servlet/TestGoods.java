package hello.world.servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

public class TestGoods extends HttpServlet {
    private static DBUtilsDaoGoods dao=new DBUtilsDaoGoods();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{
            List list=dao.findAll();
            Goods goods=new Goods();
            PrintWriter out=response.getWriter();
            for(int i=0;i<list.size();i++){
                goods= (Goods)list.get(i);
                out.write("商品名称："+goods.getName()+"|商品价格："+goods.getPrice()+
                        "|商品描述："+goods.getDescription()+"|商品图片："+goods.getPicture()+"</br>");
            }
        }catch(SQLException e){

        }


    }
}
