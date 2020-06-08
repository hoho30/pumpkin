package hello.world.dao;

import hello.world.javaClass.BuyGoodsData;
import hello.world.javaClass.C3p0Utils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

public class BuyGoodsDataDao {
    public void insertBuyGoodsData(BuyGoodsData buyGoodsData)throws SQLException{
        QueryRunner runner = new QueryRunner(C3p0Utils.getDataSource());
        String sql = "call insertBuyGoodsData(?,?,?,?,?,?,?)";
        Object[] param = {
                buyGoodsData.getTime(),
                buyGoodsData.getName(),
                buyGoodsData.getId(),
                buyGoodsData.getGoodsName(),
                buyGoodsData.getCategory(),
                buyGoodsData.getPrice(),
                buyGoodsData.getNumber()
        };
        runner.update(sql, param);
    }
    public List<BuyGoodsData> findAllBuyGoodsData()throws SQLException{
        QueryRunner runner = new QueryRunner(C3p0Utils.getDataSource());
        String sql = "call findAllBuyGoodsData()";
        return runner.query(sql,new BeanListHandler<>(BuyGoodsData.class));
    }
}
