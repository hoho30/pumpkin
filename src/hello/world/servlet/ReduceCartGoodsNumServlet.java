package hello.world.servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Iterator;
import java.util.Map;

public class ReduceCartGoodsNumServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession();
        int id=Integer.parseInt(request.getParameter("id"));
        Map<Goods,Integer> cart=(Map<Goods,Integer>)session.getAttribute("cart");
        Iterator<Map.Entry<Goods,Integer>> it=cart.entrySet().iterator();
        while (it.hasNext()){
            Map.Entry<Goods,Integer> entry=it.next();
            if(entry.getKey().getId()==id){
                entry.setValue(entry.getValue()-1);
                if(entry.getValue()==0){
                    it.remove();
                }
                if(cart.size()==0){
                    System.out.println("购物车空了");
                    session.removeAttribute("cart");
                }
            }
        }
//        for(Map.Entry<Goods,Integer> entry :cart.entrySet()){
//            if(entry.getKey().getId()==id){
//                entry.setValue(entry.getValue()-1);
//                if(entry.getValue()==0){
//                    cart.
//                }
//                if(cart.size()==0){
//                    System.out.println("购物车空了");
//                    session.removeAttribute("cart");
//                }
//            }
//        }
        session.setAttribute("cart",cart);
        response.sendRedirect("/pumpkin/cart.jsp");

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }
}
