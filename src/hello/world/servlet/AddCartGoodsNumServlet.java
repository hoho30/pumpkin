package hello.world.servlet;

import hello.world.javaClass.Goods;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Map;

public class AddCartGoodsNumServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession();
        int id=Integer.parseInt(request.getParameter("id"));
        Map<Goods,Integer> cart=(Map<Goods,Integer>)session.getAttribute("cart");
        for(Map.Entry<Goods,Integer> entry :cart.entrySet()){
            if(entry.getKey().getId()==id){
                entry.setValue(entry.getValue()+1);
            }
        }
        session.setAttribute("cart",cart);
        response.sendRedirect("cart.jsp#"+request.getParameter("xuHao"));


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
