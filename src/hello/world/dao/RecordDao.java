package hello.world.dao;

import hello.world.javaClass.C3p0Utils;
import hello.world.javaClass.Record;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

public class RecordDao {
    public List<Record> findAll() throws SQLException {
        QueryRunner runner = new QueryRunner(C3p0Utils.getDataSource());
        // 写SQL语句
        String sql = "call findAllRecord()";
        return runner.query(sql,
                new BeanListHandler<>(Record.class));

    }
    public void insertRecord
            (Record record)
            throws SQLException{
        QueryRunner runner = new QueryRunner(C3p0Utils.getDataSource());
        String sql ="call insertRecord(?,?,?,?)";
        Object[] param = {
                record.getTime(),
                record.getUsername(),
                record.getOperation(),
                record.getIp()
        };
        runner.update(sql,param);
    }

}
