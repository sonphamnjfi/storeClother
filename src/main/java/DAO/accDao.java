package DAO;

import connect.connectDB;
import entity.account;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class accDao {

    public  accDao() {}

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public account login(String us, String pass) {
        String query = "select * from acc where username = ? and pass = ?";
        try {
            conn = new connectDB().getMySQLConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1,us);
            ps.setString(2,pass);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new account(rs.getString(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4));
            }
        }catch (Exception e) {}
        return null;
    }

    public account check(String us) {
        String query = "select * from acc where username = ? ";
        try {
            conn = new connectDB().getMySQLConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1,us);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new account(rs.getString(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4));
            }
        }catch (Exception e) {}
        return null;
    }

    public void signup(String us, String pass) {
        String query = "insert into acc values(?,?,0,0)";
        try {
            conn = new connectDB().getMySQLConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, us);
            ps.setString(2, pass);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void resetpass( String us, String pass ) {
        String query = "update acc set pass = ? where username = ?";
        try {
            conn = new connectDB().getMySQLConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, pass);
            ps.setString(2, us);
            ps.executeUpdate();
        }catch (Exception e) {}
    }


    public static void main(String[] args) {
        accDao ad = new accDao();
//        // test acc
//        account ac = ad.login("admin1", "khongcopass");
//        System.out.print(ac);
        // test check
//        account ac = ad.check("nhanvien1");
//        System.out.println(ac);
//        ad.signup("test1", "passtest");
//        // test resetpass
//        ad.resetpass("admin1", "pass");
    }

}
