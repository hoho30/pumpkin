package hello.world.servlet.hello.world.example;

import com.mchange.v2.c3p0.ComboPooledDataSource;

import javax.sql.DataSource;
import java.sql.SQLException;

public class example4 {
    public static DataSource ds=null;
    static {
        ComboPooledDataSource cpds=new ComboPooledDataSource();
        try{
            cpds.setDriverClass("com.mysql.cj.jdbc.Driver");
            cpds.setJdbcUrl("jdbc:mysql://localhost:3306/test2");
            cpds.setUser("root");
            cpds.setPassword("1234");
            cpds.setInitialPoolSize(5);
            cpds.setMaxPoolSize(15);
            ds=cpds;
        }catch(Exception e){
            throw new ExceptionInInitializerError(e);
        }
    }

    public static void main(String[] args) throws SQLException {
        System.out.println(ds.getConnection());
    }
}
