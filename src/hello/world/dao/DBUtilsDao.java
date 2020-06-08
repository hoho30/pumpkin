package hello.world.dao;
import java.sql.SQLException;
import java.util.List;

import hello.world.javaClass.C3p0Utils;
import hello.world.javaClass.User;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

public class DBUtilsDao {
    // 查询所有，返回List集合
    public List<User> findAll() throws SQLException {
        // 创建QueryRunner对象
        QueryRunner runner = new QueryRunner(C3p0Utils.getDataSource());
        // 写SQL语句
        String sql = "select * from user";
        // 调用方法
        return runner.query(sql,
                new BeanListHandler<>(User.class));
    }
    // 查询单个，返回对象
    public User find(String name) throws SQLException {
        // 创建QueryRunner对象
        QueryRunner runner = new QueryRunner(C3p0Utils.getDataSource());
        // 写SQL语句
        String sql = "select * from user where username=?";
        // 调用方法
        return runner.query(sql,
                new BeanHandler<>(User.class), new Object[] { name });
    }
    // 添加用户的操作
    public void insert(User user) throws SQLException {
        // 创建QueryRunner对象
        QueryRunner runner = new QueryRunner(C3p0Utils.getDataSource());
        // 写SQL语句
        String sql = "insert into user  values (?,?,?)";
        // 调用方法
        Object[] param = {user.getUsername(), user.getPassword(),user.getEmail()};
        runner.update(sql,param);
    }
    // 修改用户的操作
    public void update(User user) throws SQLException {
        // 创建QueryRunner对象
        QueryRunner runner = new QueryRunner(C3p0Utils.getDataSource());
        // 写SQL语句
        String sql = "update  user set password=?,email=? where username=?";
        // 调用方法
        Object[] param = {user.getPassword(),user.getEmail(), user.getUsername() };
        runner.update(sql, param);
    }
    // 删除用户的操作
    public void delete(int id) throws SQLException {
        // 创建QueryRunner对象
        QueryRunner runner = new QueryRunner(C3p0Utils.getDataSource());
        // 写SQL语句
        String sql = "delete from user where id=?";
        // 调用方法
        runner.update(sql, id);
    }
}