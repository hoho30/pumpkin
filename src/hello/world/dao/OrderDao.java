package hello.world.dao;
import java.sql.SQLException;
import java.util.List;

import hello.world.javaClass.C3p0Utils;
import hello.world.javaClass.Order;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

public class OrderDao {
    public List<Order> find(String username) throws SQLException{
        QueryRunner runner = new QueryRunner(C3p0Utils.getDataSource());
        // 写SQL语句
        String sql = "call EquiryOrder(\"" +
                username+
                "\");";
        return runner.query(sql,
                new BeanListHandler<>(Order.class));

    }
    public void insertOrders
            (String username,String dtime)
            throws SQLException{
        QueryRunner runner = new QueryRunner(C3p0Utils.getDataSource());
        String sql ="call InsertOrders(?,?)";
        Object[] param = {username,dtime};
        runner.update(sql, param);
    }
    public void insertOrder_Goods
            (int oid,int gid,int number,String name,float price)
            throws SQLException{
        QueryRunner runner = new QueryRunner(C3p0Utils.getDataSource());
        String sql ="call insertOrder_Goods(?,?,?,?,?)";
        Object[] param = {oid,gid,number,name,price};
        runner.update(sql,
                param);
    }
    public int findOrderId(String username,String dtime) throws SQLException{
        QueryRunner runner = new QueryRunner(C3p0Utils.getDataSource());
        // 写SQL语句
        String sql = "call equiryOrderid(?,?);";
        return (int)runner.query(sql,
                new ScalarHandler<>("id"),new Object[]{username,dtime});

    }


}
