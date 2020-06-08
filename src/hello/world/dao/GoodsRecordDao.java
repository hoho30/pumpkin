package hello.world.dao;

import hello.world.javaClass.C3p0Utils;
import hello.world.javaClass.GoodsRecord;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

public class GoodsRecordDao  {
    public void insertGoodsRecord(GoodsRecord goodsRecord)throws SQLException {
        QueryRunner runner = new QueryRunner(C3p0Utils.getDataSource());
        String sql = "call insertGoodsRecord(?,?,?,?,?,?)";
        Object[] param = {
                goodsRecord.getTime(),
                goodsRecord.getUserName(),
                goodsRecord.getGoodsId(),
                goodsRecord.getGoodsName(),
                goodsRecord.getOperation(),
                goodsRecord.getSalesmanName()
        };
        runner.update(sql,param);
    }

    public List<GoodsRecord> findGoodsRecord(int id)throws SQLException{
        QueryRunner runner = new QueryRunner(C3p0Utils.getDataSource());
        String sql = "call findGoodsRecord(?)";
        return runner.query(sql,new BeanListHandler<>(GoodsRecord.class),id);
    }

    public List<GoodsRecord> findAllGoodsRecord(String sname)throws SQLException{
        QueryRunner runner = new QueryRunner(C3p0Utils.getDataSource());
        String sql = "call findAllGoodsRecord(?)";
        return runner.query(sql,new BeanListHandler<>(GoodsRecord.class),sname);
    }
}

