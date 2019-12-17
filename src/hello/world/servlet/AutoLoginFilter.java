package hello.world.servlet;

import javax.servlet.*;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class AutoLoginFilter implements Filter {
    private static DBUtilsDao dao=new DBUtilsDao();
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
            throws ServletException, IOException {
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
        String date=df.format(new Date());
        RecordDao recordDao=new RecordDao();
        HttpServletRequest request=(HttpServletRequest)req;
        Cookie[] cookies=request.getCookies();
        String autologin=null;
        for(int i=0;cookies!=null&&i<cookies.length;i++){
            if("autoLogin".equals(cookies[i].getName())){
                autologin=cookies[i].getValue();
                break;
            }
        }

        if(autologin!=null&& request.getSession().getAttribute("user")==null){
            String[] parts=autologin.split("-");
            User user=new User();
            user.setUsername(parts[0]);
            user.setPassword(parts[1]);
            try{
                if(dao.find(user.getUsername())!=null&&
                        dao.find(user.getUsername()).getPassword().equals(user.getPassword())){
                    user=dao.find(user.getUsername());
                    request.getSession().setAttribute("user",user);
                    recordDao.insertRecord(date,user.getUsername(),"自动登录商城",request.getRemoteAddr());
                }

            }catch (SQLException e){
                e.printStackTrace();
            }

        }
        chain.doFilter(req, resp);
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
