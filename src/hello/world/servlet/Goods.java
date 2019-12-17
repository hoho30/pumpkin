package hello.world.servlet;

public class Goods {
    private int id;
    private String name;
    private int price;
    private String description;
    private String picture;
    private int sales;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public int getSales() {
        return sales;
    }

    public void setSales(int sales) {
        this.sales = sales;
    }

    public boolean equals(Object obj){
        if(this == obj){
            return true;//地址相等
        }

        if(obj == null){
            return false;//非空性：对于任意非空引用x，x.equals(null)应该返回false。
        }

        if(obj instanceof Goods){
            Goods other = (Goods) obj;
            //需要比较的字段相等，则这两个对象相等
            if(this.getId()==other.getId()){
                return true;
            }
        }

        return false;
    }
    public int hashCode() {
        int result = 17;
        Integer i=id;
        result = 31 * result + i.hashCode();
        return result;
    }

}
