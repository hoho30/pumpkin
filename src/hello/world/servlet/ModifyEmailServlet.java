package hello.world.servlet;

import hello.world.dao.DBUtilsDao;
import hello.world.javaClass.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

public class ModifyEmailServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        DBUtilsDao dbUtilsDao=new DBUtilsDao();
        User user=(User) request.getSession().getAttribute("user");
        user.setEmail(request.getParameter("email"));
        try {
            dbUtilsDao.update(user);

        }catch (SQLException e){
            e.printStackTrace();
        }

        response.sendRedirect("modifyUser.jsp");

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
