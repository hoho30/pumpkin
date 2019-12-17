package hello.world.servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class MyOrderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //System.out.println(request.getRequestURI());
        OrderDao orderDao=new OrderDao();
        User user=(User) request.getSession().getAttribute("user");
        try{
            List<Order> list=orderDao.find(user.getUsername());
//            for(Order i:list){
//                System.out.println(i.getNumber());
//            }
            Collections.sort(list);
            request.setAttribute("orders",list);
            request.getRequestDispatcher("/pumpkin/myorder.jsp").forward(request,response);

        }catch (SQLException e){
            e.printStackTrace();
        }


    }
}
