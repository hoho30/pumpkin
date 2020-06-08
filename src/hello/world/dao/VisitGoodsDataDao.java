package hello.world.dao;

import hello.world.javaClass.C3p0Utils;
import hello.world.javaClass.VisitGoodsData;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

public class VisitGoodsDataDao {
    public void insertVisitGoodsData(VisitGoodsData visitGoodsData)throws SQLException{
        QueryRunner runner = new QueryRunner(C3p0Utils.getDataSource());
        String sql = "call insertVisitGoodsData(?,?,?,?,?,?)";
        Object[] param = {
                visitGoodsData.getDatetime(),
                visitGoodsData.getName(),
                visitGoodsData.getId(),
                visitGoodsData.getGoodsName(),
                visitGoodsData.getCategory(),
                visitGoodsData.getTime()
        };
        runner.update(sql,param);
    }

    public List<VisitGoodsData> findAllVisitGoodsData()throws SQLException{
        QueryRunner runner = new QueryRunner(C3p0Utils.getDataSource());
        String sql = "call findAllVisitGoodsData()";
        return runner.query(sql,new BeanListHandler<>(VisitGoodsData.class));
    }
}
