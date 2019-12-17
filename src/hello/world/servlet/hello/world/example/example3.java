package hello.world.servlet.hello.world.example;

import java.sql.*;

public class example3 {
    /*public static void main(String[] args) throws SQLException {
        Statement stmt=null;
        ResultSet rs=null;
        Connection conn=null;


        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url="jdbc:mysql://localhost:3306/test2";
            String username="root";
            String password="1234";
            conn= DriverManager.getConnection(url,username,password);
            stmt=conn.createStatement();
            String sql="select * from test1";
        rs=stmt.executeQuery(sql);
        while(rs.next()){
            String id=rs.getString("name");
            int num=rs.getInt("num");
            System.out.println(id+"|"+num);
        }
    }catch(ClassNotFoundException e){
        e.printStackTrace();
    }
    }*/
}
