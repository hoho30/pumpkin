package hello.world.servlet;
import java.sql.SQLException;
import java.util.List;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

public class DBUtilsDao {
    // 查询所有，返回List集合
    public List findAll() throws SQLException {
        // 创建QueryRunner对象
        QueryRunner runner = new QueryRunner(C3p0Utils.getDataSource());
        // 写SQL语句
        String sql = "select * from user";
        // 调用方法
        List list = (List) runner.query(sql,
                new BeanListHandler(User.class));
        return list;
    }
    // 查询单个，返回对象
    public User find(String name) throws SQLException {
        // 创建QueryRunner对象
        QueryRunner runner = new QueryRunner(C3p0Utils.getDataSource());
        // 写SQL语句
        String sql = "select * from user where username=?";
        // 调用方法
        User user = (User) runner.query(sql,
                new BeanHandler(User.class), new Object[] { name });
        return user;
    }
    // 添加用户的操作
    public Boolean insert(User user) throws SQLException {
        // 创建QueryRunner对象
        QueryRunner runner = new QueryRunner(C3p0Utils.getDataSource());
        // 写SQL语句
        String sql = "insert into user  values (?,?,?)";
        // 调用方法
        int num = runner.update(sql,
                new Object[] { user.getUsername(), user.getPassword(),user.getEmail() });
        if (num > 0)
            return true;
        return false;
    }
    // 修改用户的操作
    public Boolean update(User user) throws SQLException {
        // 创建QueryRunner对象
        QueryRunner runner = new QueryRunner(C3p0Utils.getDataSource());
        // 写SQL语句
        String sql = "update  user set password=?,email=? where username=?";
        // 调用方法
        int num = runner.update(sql, new Object[] {user.getPassword(),user.getEmail(), user.getUsername() });
        if (num > 0)
            return true;
        return false;
    }
    // 删除用户的操作
    public Boolean delete(int id) throws SQLException {
        // 创建QueryRunner对象
        QueryRunner runner = new QueryRunner(C3p0Utils.getDataSource());
        // 写SQL语句
        String sql = "delete from user where id=?";
        // 调用方法
        int num = runner.update(sql, id);
        if (num > 0)
            return true;
        return false;
    }
}