package hello.world.servlet;
import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

public class OrderDao {
    public List find(String username) throws SQLException{
        QueryRunner runner = new QueryRunner(C3p0Utils.getDataSource());
        // 写SQL语句
        String sql = "call EquiryOrder(\"" +
                username+
                "\");";
        List list = (List) runner.query(sql,
                new BeanListHandler(Order.class));
        return list;

    }
    public Boolean insertOrders
            (String username,String dtime)
            throws SQLException{
        QueryRunner runner = new QueryRunner(C3p0Utils.getDataSource());
        String sql ="call InsertOrders(?,?)";
        int num = runner.update(sql,
                new Object[] {username,dtime});
        if (num > 0)
            return true;
        return false;
    }
    public Boolean insertOrder_Goods
            (int oid,int gid,int number,String name,int price)
            throws SQLException{
        QueryRunner runner = new QueryRunner(C3p0Utils.getDataSource());
        String sql ="call insertOrder_Goods(?,?,?,?,?)";
        int num = runner.update(sql,
                new Object[] {oid,gid,number,name,price});
        if (num > 0)
            return true;
        return false;
    }
    public int findOrderId(String username,String dtime) throws SQLException{
        QueryRunner runner = new QueryRunner(C3p0Utils.getDataSource());
        // 写SQL语句
        String sql = "call equiryOrderid(?,?);";
        Integer integer= (Integer)runner.query(sql,
                new ScalarHandler<>("id"),new Object[]{username,dtime});
        return integer;

    }


}
