package DAO;

import connect.connectDB;
import entity.addItem;
import entity.cart;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class cartDao {
    public cartDao() {}

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public cart check(String username ) {
        String query = "select * from cart where username = ? ";
        try {
            conn = new connectDB().getMySQLConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1,username);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new cart(rs.getString(1),
                        rs.getLong(2));
            }
        }catch (Exception e) {}
        return null;
    }

    public void addc(cart c) {
        String query = "insert into cart VALUES(?, ?)";
        try {
            conn = new connectDB().getMySQLConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, c.getUsername());
            ps.setLong(2,c.getTotal());
            ps.executeUpdate();
        } catch (Exception e) {}
    }

    public void update( cart c ) {
        String query = "update cart set total_price = ? where username = ?";
        try {
            conn = new connectDB().getMySQLConnection();
            ps = conn.prepareStatement(query);
            ps.setLong(1, c.getTotal());
            ps.setString(2, c.getUsername());
            ps.executeUpdate();
        }catch (Exception e) {}
    }

}
