package DAO;

import connect.connectDB;
import entity.acc;
import entity.addItem;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class addDao {
    public addDao() {}

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public void addi(addItem a) {
        String query = "insert into add_item VALUES(?, ?, ?)";
        try {
            conn = new connectDB().getMySQLConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, a.getUsername());
            ps.setInt(2,a.getPID());
            ps.setInt(3,a.getAmount());
            ps.executeUpdate();
        } catch (Exception e) {}
    }

    public addItem check(String username, int pid) {
        String query = "select * from add_item where username = ? and product_id = ?";
        try {
            conn = new connectDB().getMySQLConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1,username);
            ps.setInt(2,pid);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new addItem(rs.getString(1),
                        rs.getInt(2),
                        rs.getInt(3));
            }
        }catch (Exception e) {}
        return null;
    }

    public void update( addItem a) {
        String query = "update add_item set amount = ? where username = ? and product_id = ?";
        try {
            conn = new connectDB().getMySQLConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, a.getAmount());
            ps.setString(2, a.getUsername());
            ps.setInt(3, a.getPID());
            ps.executeUpdate();
        }catch (Exception e) {}
    }

    public void delete( addItem a) {
        String query = "delete from add_item where username = ? and product_id = ?";
        try {
            conn = new connectDB().getMySQLConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, a.getUsername());
            ps.setInt(2, a.getPID());
            ps.executeUpdate();
        }catch (Exception e) {}
    }

    public void deleteall( String username) {
        String query = "delete from add_item where username = ? ";
        try {
            conn = new connectDB().getMySQLConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            ps.executeUpdate();
        }catch (Exception e) {}
    }

    public List<addItem> getaddItems(String username) {
        List<addItem> list = new ArrayList<addItem>();
        String query = "select * from add_item where username = ? ";
        try {
            conn = new connectDB().getMySQLConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1,username);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new addItem(rs.getString(1),
                        rs.getInt(2),
                        rs.getInt(3)));
            }
        }catch (Exception e) {}
        return list;
    }

    public static void main(String[] args) {
        addDao ad = new addDao();
//        addItem a = new addItem("kh10", 2,1 );
//        ad.addi(a);
        addItem ai = ad.check("kh10",2);
        System.out.println(ai);
    }
}
