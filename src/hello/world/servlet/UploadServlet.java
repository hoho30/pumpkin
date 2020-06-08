package hello.world.servlet;

import hello.world.dao.DBUtilsDaoGoods;
import hello.world.dao.RecordDao;
import hello.world.javaClass.Goods;
import hello.world.javaClass.Record;
import hello.world.javaClass.Salesman;
import hello.world.javaClass.User;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

public class UploadServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        DBUtilsDaoGoods dao=new DBUtilsDaoGoods();
        Goods goods=new Goods();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
        String date=df.format(new Date());
        DiskFileItemFactory diskFileItemFactory=new DiskFileItemFactory();
        diskFileItemFactory.setRepository(new File(this.getServletContext().getRealPath("/temp")));
        diskFileItemFactory.setSizeThreshold(1024*1024*10);
        ServletFileUpload servletFileUpload=new ServletFileUpload(diskFileItemFactory);
        servletFileUpload.setHeaderEncoding("utf-8");
        String fileName;
        String tempPicture=null;
        try{
            List<FileItem> items=servletFileUpload.parseRequest(request);
            for (FileItem item:items){
                if(item.isFormField()){
//                    System.out.println(item.getFieldName());
                    if(item.getFieldName().equals("gid")){
                        goods.setId(Integer.parseInt(item.getString("utf-8")));
                    }
                    if(item.getFieldName().equals("price")){
                        goods.setPrice(Float.parseFloat(item.getString("utf-8")));

                    }
                    if(item.getFieldName().equals("description")){
                        goods.setDescription(item.getString("utf-8"));
                    }
                    if(item.getFieldName().equals("name")){
                        goods.setName(item.getString("utf-8"));
                    }
                    if(item.getFieldName().equals("category")){
                        goods.setCategory(item.getString("utf-8"));
                    }
                    if(item.getFieldName().equals("picture")){
                        tempPicture=item.getString("utf-8");
                    }
                    if(item.getFieldName().equals("stock")){
                        goods.setStock(Integer.parseInt(item.getString("utf-8")));
                    }

                }else {
                    fileName=item.getName();
                    if(fileName!=null&& fileName.trim().length()>0){
                        fileName=fileName.substring(fileName.lastIndexOf("\\")+1);
                        fileName= UUID.randomUUID().toString()+"."+fileName.substring(fileName.lastIndexOf(".")+1);
                        String webPath="/pumpkin/graph/";
                        String filePath=getServletContext().getRealPath("/graph/"+fileName);
                        File file=new File(filePath);
                        if(file.createNewFile()){
                            System.out.println("文件创建成功");
                        }else System.out.println("文件创建失败");
                        try{
                            item.write(file);
                        }catch (Exception e){
                            e.printStackTrace();
                        }
                        goods.setPicture(webPath+fileName);
                    }
                }
            }
            if(goods.getPicture()==null||goods.getPicture().equals("")){
                System.out.println("picture is null.");
                System.out.println(tempPicture);
                goods.setPicture(tempPicture);
            }
            dao.update(goods);
            Record record = new Record();
            record.setTime(date);
            if(request.getSession().getAttribute("user").getClass().equals(User.class)){
                User user = (User)request.getSession().getAttribute("user");
                record.setUsername(user.getUsername());
            }else {
                Salesman salesman = (Salesman)request.getSession().getAttribute("user");
                record.setUsername(salesman.getName());
            }
            record.setOperation(
                    "修改商品（商品号：" +
                            goods.getId() +
                            ")");
            record.setIp(request.getRemoteAddr());
            RecordDao recordDao = new RecordDao();
            recordDao.insertRecord(record);
            response.setContentType("text/html;charset=utf-8");
            response.getWriter().write("<script>" +
                    "alert('修改成功，图片加载需要一定的时间哦，看不到图片请刷新页面');" +
                    "location.href='goodsInformation.jsp?id=" +
                    goods.getId() +
                    "';" +
                    "</script>");

        }catch (FileUploadException e){
            e.printStackTrace();
        }catch (SQLException e){
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request,response);
    }
}
