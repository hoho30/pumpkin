package hello.world.servlet;

import hello.world.dao.VisitGoodsDataDao;
import hello.world.javaClass.VisitGoodsData;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

public class InsertVisitGoodsDataServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("enter");
        VisitGoodsData visitGoodsData = new VisitGoodsData();
        VisitGoodsDataDao visitGoodsDataDao = new VisitGoodsDataDao();
        visitGoodsData.setDatetime(request.getParameter("datetime"));
        visitGoodsData.setName(request.getParameter("name"));
        visitGoodsData.setId(Integer.parseInt(request.getParameter("id")));
        visitGoodsData.setGoodsName(request.getParameter("goodsName"));
        visitGoodsData.setCategory(request.getParameter("category"));
        int time = Integer.parseInt(request.getParameter("time"))/1000;
        visitGoodsData.setTime(time);
        try {
            visitGoodsDataDao.insertVisitGoodsData(visitGoodsData);

        }catch (SQLException e){
            e.printStackTrace();
        }
    }
}
