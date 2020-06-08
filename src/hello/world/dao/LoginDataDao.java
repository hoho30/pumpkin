package hello.world.dao;

import hello.world.javaClass.C3p0Utils;
import hello.world.javaClass.LoginData;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

public class LoginDataDao {
    public void insertLoginData(LoginData loginData)throws SQLException{
        QueryRunner runner = new QueryRunner(C3p0Utils.getDataSource());
        String sql = "call insertLoginData(?,?,?,?)";
        Object[] param = {
                loginData.getName(),
                loginData.getTime(),
                loginData.getIp(),
                loginData.getOperation()
        };
        runner.update(sql,param);
    }

    public List<LoginData> findAllLoginData()throws SQLException{
        QueryRunner runner = new QueryRunner(C3p0Utils.getDataSource());
        String sql = "call findAllLoginData()";
        return runner.query(sql,new BeanListHandler<>(LoginData.class));
    }
}
