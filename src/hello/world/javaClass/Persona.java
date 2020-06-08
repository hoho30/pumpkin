package hello.world.javaClass;

import hello.world.dao.BuyGoodsDataDao;
import hello.world.dao.VisitGoodsDataDao;

import java.sql.SQLException;
import java.util.List;

public class Persona {
    private int[] persona;
    private String userName;
    public Persona(String userName){
        this.userName=userName;
        this.persona = new int [8];
        VisitGoodsDataDao visitGoodsDataDao = new VisitGoodsDataDao();
        BuyGoodsDataDao buyGoodsDataDao = new BuyGoodsDataDao();
        try{
            List<VisitGoodsData> visitGoodsDataList = visitGoodsDataDao.findAllVisitGoodsData();
            List<BuyGoodsData> buyGoodsDataList = buyGoodsDataDao.findAllBuyGoodsData();
            for(VisitGoodsData visitGoodsData:visitGoodsDataList){
                if(visitGoodsData.getName().equals(userName)||userName.equals("")){
                    switch (visitGoodsData.getCategory()){
                        case "clothing":
                            if(visitGoodsData.getTime()>60){
                                persona[0]+=2;
                            }else{
                                persona[0]+=1;
                            }
                            break;
                        case "shoes":
                            if(visitGoodsData.getTime()>60){
                                persona[1]+=2;
                            }else{
                                persona[1]+=1;
                            }
                            break;
                        case "digital":
                            if(visitGoodsData.getTime()>60){
                                persona[2]+=2;
                            }else{
                                persona[2]+=1;
                            }
                            break;
                        case "household":
                            if(visitGoodsData.getTime()>60){
                                persona[3]+=2;
                            }else{
                                persona[3]+=1;
                            }
                            break;
                        case "wash":
                            if(visitGoodsData.getTime()>60){
                                persona[4]+=2;
                            }else{
                                persona[4]+=1;
                            }
                            break;
                        case "jewellery":
                            if(visitGoodsData.getTime()>60){
                                persona[5]+=2;
                            }else{
                                persona[5]+=1;
                            }
                            break;
                        case "fresh":
                            if(visitGoodsData.getTime()>60){
                                persona[6]+=2;
                            }else{
                                persona[6]+=1;
                            }
                            break;
                        case "snacks":
                            if(visitGoodsData.getTime()>60){
                                persona[7]+=2;
                            }else{
                                persona[7]+=1;
                            }
                            break;
                    }
                }
            }
            for(BuyGoodsData buyGoodsData:buyGoodsDataList){
                if(buyGoodsData.getName().equals(userName)||userName.equals("")){
                    switch (buyGoodsData.getCategory()){
                        case "clothing":
                            persona[0]+=4;
                            break;
                        case "shoes":
                            persona[1]+=4;
                            break;
                        case "digital":
                            persona[2]+=4;
                            break;
                        case "household":
                            persona[3]+=4;
                            break;
                        case "wash":
                            persona[4]+=4;
                            break;
                        case "jewellery":
                            persona[5]+=4;
                            break;
                        case "fresh":
                            persona[6]+=4;
                            break;
                        case "snacks":
                            persona[7]+=4;
                            break;
                    }
                }
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
    }
    public int[] getPersona() {
        return persona;
    }
    public String getUserName() {
        return userName;
    }
}
