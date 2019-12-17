package hello.world.servlet;
import java.sql.SQLException;
import java.util.List;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

public class DBUtilsDaoGoods {
    public List findAll() throws SQLException {
        // 创建QueryRunner对象
        QueryRunner runner = new QueryRunner(C3p0Utils.getDataSource());
        // 写SQL语句
        String sql = "select * from goods";
        // 调用方法
        List list = (List) runner.query(sql,
                new BeanListHandler(Goods.class));
        return list;
        
    }
    // 查询单个，返回对象
    public Goods find(int id) throws SQLException {
        // 创建QueryRunner对象
        QueryRunner runner = new QueryRunner(C3p0Utils.getDataSource());
        // 写SQL语句
        String sql = "select * from goods where id=?";
        // 调用方法
        Goods goods = (Goods) runner.query(sql,
                new BeanHandler(Goods.class), new Object[] { id });
        return goods;
    }
    // 添加用户的操作
    public Boolean insert(Goods goods) throws SQLException {
        // 创建QueryRunner对象
        QueryRunner runner = new QueryRunner(C3p0Utils.getDataSource());
        // 写SQL语句
        String sql = "insert into goods (name,price,description,picture) values (?,?,?,?)";
        // 调用方法
        int num = runner.update(sql,
                new Object[] { goods.getName(),goods.getPrice(),goods.getDescription(),goods.getPicture() });
        if (num > 0)
            return true;
        return false;
    }
    // 修改用户的操作
    public Boolean update(Goods goods) throws SQLException {
        // 创建QueryRunner对象
        QueryRunner runner = new QueryRunner(C3p0Utils.getDataSource());
        // 写SQL语句
        String sql = "update  goods set name=? , price=? , description=? , picture=? where id=?";
        // 调用方法
        int num = runner.update(sql, new Object[] {
                goods.getName(),goods.getPrice(),goods.getDescription(),goods.getPicture(),goods.getId()});
        if (num > 0)
            return true;
        return false;
    }
    // 删除用户的操作
    public Boolean delete(int id) throws SQLException {
        // 创建QueryRunner对象
        QueryRunner runner = new QueryRunner(C3p0Utils.getDataSource());
        // 写SQL语句
        String sql = "delete from goods where id=?";
        // 调用方法
        int num = runner.update(sql, id);
        if (num > 0)
            return true;
        return false;
    }
    public Boolean addSales(int gid,int sales)throws SQLException{
        QueryRunner runner = new QueryRunner(C3p0Utils.getDataSource());
        String sql = "call addSales(?,?)";
        int num =runner.update(sql,new Object[]{gid,sales});
        if (num > 0)
            return true;
        return false;
    }


}
