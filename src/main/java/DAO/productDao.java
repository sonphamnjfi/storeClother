package DAO;

import connect.connectDB;
import entity.product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class productDao {

    public  productDao() {}

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    product p = new product();

    public List<product> getProducts() {
        List<product> list = new ArrayList<product>();
        String query = "select * from product";
        try{
            conn = new connectDB().getMySQLConnection();
            ps = conn.prepareStatement(query);
            rs=ps.executeQuery();
            while (rs.next()) {
                list.add(new product(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5)));
            }
        }catch (Exception e) {}
        return list;
    }

    public product getp(String id) {
        String query = "select * from product where id = ?";
        try {
            conn = new connectDB().getMySQLConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs =ps.executeQuery();
            while (rs.next()) {
                return new product(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5));
            }
        }catch (Exception e) {}
        return null;
    }


    public static void main(String[] args) {
        productDao pd = new productDao();
//        List<product> a = pd.getProducts();
//        for(product pt:a) {
//            System.out.println(pt);
//        }
        product p = pd.getp("5");
        System.out.println(p);
    }
}
