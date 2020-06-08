package hello.world.javaClass;

import com.mchange.v2.c3p0.ComboPooledDataSource;

import javax.sql.DataSource;

public class C3p0Utils {
    public static DataSource ds=null;
    public static ComboPooledDataSource cpds=new ComboPooledDataSource();
    static {

        try{
            cpds.setDriverClass("com.mysql.cj.jdbc.Driver");
            cpds.setJdbcUrl("jdbc:mysql://localhost:3306/pumpkin?serverTimezone=GMT");
            cpds.setUser("root");
//            cpds.setPassword("root");
            cpds.setPassword("Mysql@@0513121002");
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
    public static void close(){
        cpds.close();
    }
}
