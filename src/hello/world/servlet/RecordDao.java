package hello.world.servlet;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

public class RecordDao {
    public List findAll() throws SQLException {
        QueryRunner runner = new QueryRunner(C3p0Utils.getDataSource());
        // 写SQL语句
        String sql = "call findAllRecord()";
        List list = (List) runner.query(sql,
                new BeanListHandler(Record.class));
        return list;

    }
    public Boolean insertRecord
            (String dtime,String uname,String operation,String ip)
            throws SQLException{
        QueryRunner runner = new QueryRunner(C3p0Utils.getDataSource());
        String sql ="call insertRecord(?,?,?,?)";
        int num = runner.update(sql,
                new Object[] {dtime,uname,operation,ip});
        if (num > 0)
            return true;
        return false;
    }

}
