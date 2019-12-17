package hello.world.servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

public class DeleteGoodsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        DBUtilsDaoGoods dao=new DBUtilsDaoGoods();
        try{
            dao.delete(Integer.parseInt(request.getParameter("id")));

        }catch (SQLException e){
            e.printStackTrace();
        }
        response.sendRedirect("/pumpkin/goodsManage.jsp");

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
