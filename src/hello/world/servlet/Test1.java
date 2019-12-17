package hello.world.servlet;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Test1 extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        String lastAccessTime=null;
        Cookie[] cookies=request.getCookies();
        for(int i=0;cookies!=null&& i<cookies.length;i++){
            System.out.println(cookies[i].getName());
            if("lastAccess".equals(cookies[i].getName())){
                lastAccessTime=cookies[i].getValue();
                break;
            }
        }
        if(lastAccessTime==null){
            response.getWriter().print("您是首次访问本站");
        }
        else {
            response.getWriter().print(("您的上次访问时间是："+lastAccessTime));
        }
        String currentTime=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(new Date());
        Cookie cookie=new Cookie("lastAccess",currentTime);
        cookie.setMaxAge(60*60);
        response.addCookie(cookie);
    }
}
