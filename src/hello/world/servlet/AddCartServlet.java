package hello.world.servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

public class AddCartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Map<Goods,Integer> cart=(Map<Goods,Integer>)request.getSession().getAttribute("cart");
        if(cart==null){
            cart=new HashMap<Goods,Integer>();
        }
        DBUtilsDaoGoods dao=new DBUtilsDaoGoods();
        int id=Integer.parseInt(request.getParameter("id"));
        int number=Integer.parseInt(request.getParameter("number"));
        try{
            Goods goods=dao.find(id);
            if(goods!=null){
                Integer count=cart.put(goods,number);
                if(count!=null){
                    cart.put(goods,number+count);
                }
                request.getSession().setAttribute("cart",cart);
            }
            response.sendRedirect("/pumpkin/index.jsp#"+request.getParameter("id"));
        }catch (SQLException e){
           e.printStackTrace();
        }



    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
