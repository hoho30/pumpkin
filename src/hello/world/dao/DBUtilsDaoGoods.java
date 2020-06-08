package hello.world.dao;
import java.sql.SQLException;
import java.util.List;

import hello.world.javaClass.C3p0Utils;
import hello.world.javaClass.Goods;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

public class DBUtilsDaoGoods {
    public List<Goods> findAll() throws SQLException {
        // 创建QueryRunner对象
        QueryRunner runner = new QueryRunner(C3p0Utils.getDataSource());
        // 写SQL语句
        String sql = "select * from goods";
        // 调用方法
         return runner.query(sql,
                new BeanListHandler<>(Goods.class));
    }
    // 查询单个，返回对象
    public Goods find(int id) throws SQLException {
        // 创建QueryRunner对象
        QueryRunner runner = new QueryRunner(C3p0Utils.getDataSource());
        // 写SQL语句
        String sql = "select * from goods where id=?";
        // 调用方法
        return (Goods) runner.query(sql,
                new BeanHandler<>(Goods.class), new Object[] { id });
    }
    // 添加用户的操作
    public int insert(Goods goods) throws SQLException {
        // 创建QueryRunner对象
        QueryRunner runner = new QueryRunner(C3p0Utils.getDataSource());
        // 写SQL语句
        String sql = "call insertGoods(?,?,?,?,?,?,?)";
        // 调用方法
        Object[] param = {goods.getName(),
                goods.getPrice(),
                goods.getPicture(),
                goods.getDescription(),
                goods.getCategory(),
                goods.getSalesmanName(),
                goods.getStock()
        };
        System.out.println("addgoods:");
        for(Object o:param){
            System.out.println(o);
            System.out.println(' ');
        }
        return runner.query(sql,new ScalarHandler<>("id"),param);
    }
    // 修改用户的操作
    public void update(Goods goods) throws SQLException {
        // 创建QueryRunner对象
        QueryRunner runner = new QueryRunner(C3p0Utils.getDataSource());
        // 写SQL语句
        String sql = "call updateGoods(?,?,?,?,?,?,?)";
        // 调用方法
        Object[] param = {goods.getId(),
                goods.getName(),
                goods.getPrice(),
                goods.getPicture(),
                goods.getDescription(),
                goods.getCategory(),
                goods.getStock()
        };
        runner.update(sql, param);
    }
    // 删除用户的操作
    public void delete(int id) throws SQLException {
        // 创建QueryRunner对象
        QueryRunner runner = new QueryRunner(C3p0Utils.getDataSource());
        // 写SQL语句
        String sql = "delete from goods where id=?";
        // 调用方法
        runner.update(sql, id);
    }
    public void addSales(int gid,int sales)throws SQLException{
        QueryRunner runner = new QueryRunner(C3p0Utils.getDataSource());
        String sql = "call addSales(?,?)";
        Object[] param = {gid,sales};
        runner.update(sql,param);
    }
    public void buyGoods(int num,int id) throws SQLException{
        QueryRunner runner = new QueryRunner(C3p0Utils.getDataSource());
        String sql = "call buyGoods(?,?)";
        Object[] param = {num,id};
        runner.update(sql, param);
    }
    public int viewStock(int id)throws SQLException{
        QueryRunner runner = new QueryRunner(C3p0Utils.getDataSource());
        String sql = "call viewStock(?)";
        return runner.query(sql,new ScalarHandler<>("stock"),id);
    }


}
