package hello.world.servlet;

import com.mchange.v2.c3p0.ComboPooledDataSource;

import javax.sql.DataSource;

public class C3p0Utils {
    public static DataSource ds=null;
    static {
        ComboPooledDataSource cpds=new ComboPooledDataSource();
        try{
            cpds.setDriverClass("com.mysql.cj.jdbc.Driver");
            cpds.setJdbcUrl("jdbc:mysql://localhost:3306/sh");
            cpds.setUser("root");
            cpds.setPassword("root");
            cpds.setInitialPoolSize(5);
            cpds.setMaxPoolSize(15);
            ds=cpds;
        }catch(Exception e){
            throw new ExceptionInInitializerError(e);
        }
    }
    public static DataSource getDataSource(){
        return ds;
    }
}
