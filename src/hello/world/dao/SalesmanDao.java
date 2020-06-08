package hello.world.dao;

import hello.world.javaClass.C3p0Utils;
import hello.world.javaClass.Salesman;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

public class SalesmanDao {
    public Salesman findSalesman(String name)throws SQLException {
        QueryRunner runner = new QueryRunner(C3p0Utils.getDataSource());
        String sql = "call findSalesman(?)";
        return runner.query(sql,
                new BeanHandler<>(Salesman.class),name);
    }

    public void insertSalesman(Salesman salesman)throws SQLException{
        QueryRunner runner = new QueryRunner(C3p0Utils.getDataSource());
        String sql = "call insertSalesman(?,?)";
        Object[] param = {
                salesman.getName(),
                salesman.getPassword()
        };
        runner.update(sql,param);
    }

    public void updateSalesman(Salesman salesman)throws SQLException{
        QueryRunner runner = new QueryRunner(C3p0Utils.getDataSource());
        String sql = "call updateSalesman(?,?)";
        Object[] param = {
                salesman.getName(),
                salesman.getPassword()
        };
        runner.update(sql,param);
    }

    public void deleteSalesman(String sname)throws SQLException{
        QueryRunner runner = new QueryRunner(C3p0Utils.getDataSource());
        String sql = "call deleteSalesman(?)";
        runner.update(sql,sname);
    }

    public List<Salesman> findAllSalesman()throws SQLException{
        QueryRunner runner = new QueryRunner(C3p0Utils.getDataSource());
        String sql = "call findAllSalesman()";
        return runner.query(sql,new BeanListHandler<>(Salesman.class));
    }
}
