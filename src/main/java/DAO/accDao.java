package DAO;

import connect.connectDB;
import entity.acc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class accDao {

    public accDao() {}

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public acc login(String us, String pass) {
        String query = "select * from customer where username = ? and password = ?";
        try {
            conn = new connectDB().getMySQLConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1,us);
            ps.setString(2,pass);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new acc(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5));
            }
        }catch (Exception e) {}
        return null;
    }

    public acc check(String us) {
        String query = "select * from customer where username = ? ";
        try {
            conn = new connectDB().getMySQLConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1,us);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new acc(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5));
            }
        }catch (Exception e) {}
        return null;
    }

    public void signup(acc a) {
        String query = "insert into customer VALUES(? , ?, ?,?,?)";
        try {
            conn = new connectDB().getMySQLConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, a.getUsername());
            ps.setString(2, a.getPass());
            ps.setString(3, a.getName());
            ps.setString(4, a.getPhone());
            ps.setString(5, a.getAddress());
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void resetpass( String us, String pass ) {
        String query = "update customer set password = ? where username = ?";
        try {
            conn = new connectDB().getMySQLConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, pass);
            ps.setString(2, us);
            ps.executeUpdate();
        }catch (Exception e) {}
    }

    public void update(acc a) {
        String query = "update customer set password = ? , NAME= ? , phone= ? , address= ? where username = ? ";
        try {
            conn = new connectDB().getMySQLConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, a.getPass());
            ps.setString(2, a.getName());
            ps.setString(3, a.getPhone());
            ps.setString(4, a.getAddress());
            ps.setString(5, a.getUsername());
            ps.executeUpdate();
        }catch (Exception e) {}
    }


    public static void main(String[] args) {
        accDao ad = new accDao();
//        acc b = ad.login("kh10", "123");
//        System.out.println(b);
        // test check
//        acc ac = ad.check("kh01");
//        System.out.println(ac);
        acc b = new acc("agfh", "ah", "adadad", "093048" , "uiy");
        ad.update(b);
//        // test resetpass
//        ad.resetpass("kh05", "huhu");
    }


}
