package DAO;

import connect.connectDB;
import entity.code;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CodeDao {

    public CodeDao(){}

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    // get list code
    public List<code> getall() {
        List<code> list = new ArrayList<code>();
        String query = "SELECT * FROM CODE";
        try {
            conn = new connectDB().getMySQLConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new code(rs.getString(1),
                        rs.getString(2),
                        rs.getLong(3),
                        rs.getLong(4),
                        rs.getDate(5),
                        rs.getDate(6)));
            }
        }catch (Exception e) {}
        return list;
    }

    //get code by id
    public code getcode(String id) {
        String query = "SELECT * FROM CODE WHERE IDCODE = ? " ;
        code code1 = null;
        try {
            conn = new connectDB().getMySQLConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                code1 = new code(rs.getString(1),
                        rs.getString(2),
                        rs.getLong(3),
                        rs.getLong(4),
                        rs.getDate(5),
                        rs.getDate(6));
            }
        }catch (Exception e) {}
        return code1;
    }

    //update code by id
    public void update(code code1) {
        String query = "update code set NAME = ? , totalBill = ?, discount = ?, beginDate = ?, endDate = ? where idCode = ?;";
        try {
            conn = new connectDB().getMySQLConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, code1.getName());
            ps.setLong(2, code1.getTotal());
            ps.setLong(3, code1.getDiscount());
            ps.setDate(4, code1.getBegin());
            ps.setDate(5, code1.getEnd());
            ps.setString(6, code1.getId());
            ps.executeUpdate();
        }catch (Exception e) { }
    }
    // add code
    public void add(code code1) {
        String query = "INSERT INTO CODE" + " (idCode, NAME , totalBill, discount, beginDate, endDate) VALUES " + " (?, ?, ?, ?, ?, ?);";
        try {
            conn = new connectDB().getMySQLConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, code1.getId());
            ps.setString(2, code1.getName());
            ps.setLong(3, code1.getTotal());
            ps.setLong(4, code1.getDiscount());
            ps.setDate(5, code1.getBegin());
            ps.setDate(6, code1.getEnd());
            ps.executeUpdate();
        } catch (Exception e) {
            // TODO: handle exception
        }

        return;
    }

    // delete code from database
    public void delete(String id) {
        String query = "delete from code where idCode = ?";
        try {
            conn = new connectDB().getMySQLConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            ps.executeUpdate();
        }catch (Exception e) {}
    }

    public static void main(String[] args) {
        CodeDao cd = new CodeDao();
//        // test get list code
//		List<code> list = cd.getall();
//		for(code Code : list) {
//			System.out.println(Code);
//		}
//		 // test get code
//        String id = "11day01";
//		code code1 = cd.getcode(id);
//		System.out.println(code1);
//		// test delete code
//        cd.delete("11day03");

//        // test update code
//		String id = "11day07";
//		String name = "07day";
//		Long total = (long) 9872433;
//		Long dis = (long) 76982;
//		Date begin = Date.valueOf("2021-11-01");
//		Date end = Date.valueOf("2021-12-09");
//		code code1 = new code(id, name , total, dis, begin, end);
//		cd.update(code1);

//		// test add code
//		id = "hayday42";
//		 name = "hay42";
//		total = (long) 56700;
//		dis = (long) 247000;
//		begin = Date.valueOf("2021-12-21");
//		end = Date.valueOf("2021-10-10");
//		code1 = new code(id, name , total, dis, begin, end);
//		cd.add(code1);
    }

}
