package beans;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;


public class Dao {
   String dburl = "jdbc:oracle:thin:@dal.mockingu.com:1521:xe";
   String dbuser = "minwoo";
   String dbpassword = "123";

    public Map<String, Object> getRankTopData() {
      try {
         Connection conn = DriverManager.getConnection(dburl, dbuser, dbpassword);
         String sql = "select * from baseresult order by tried asc, elapsed asc";
         PreparedStatement ps = conn.prepareStatement(sql);
         ResultSet rs = ps.executeQuery();
         Map<String, Object> ret;
         if (rs.next()) {
            ret = new LinkedHashMap<>();
            ret.put("player", rs.getString("player"));
            ret.put("serial", rs.getString("serial"));
            ret.put("tried", rs.getInt("tried"));
            ret.put("elapsed", rs.getDouble("elapsed"));
            ret.put("logdate", rs.getDate("logdate"));
         } else {
            ret = null;
         }
         conn.close();
         return ret;
      } catch (Exception e) {
         e.printStackTrace();
         return null;
      }
   }
   public boolean checkId(String id) {
	   try {
	         Connection conn = DriverManager.getConnection(dburl, dbuser, dbpassword);
	         String sql = "select * from account";
	         PreparedStatement ps = conn.prepareStatement(sql);
	         ResultSet rs = ps.executeQuery();
	         if (rs.next()) {
	            do {
	             String dbid = rs.getString("id");
	             if(dbid.equals(id)) {
	            	 return false;
	             }	              
	            } while (rs.next());
	         } else {		
	           return true;
	         }
	         conn.close();
	        
	      } catch (Exception e) {
	         e.printStackTrace();
	         return false;
	      }
	   return true;
   } 

   public List<Map<String, Object>> getAllDatas() {
      try {
         Connection conn = DriverManager.getConnection(dburl, dbuser, dbpassword);
         String sql = "select * from account";
         PreparedStatement ps = conn.prepareStatement(sql);
         ResultSet rs = ps.executeQuery();
         List<Map<String, Object>> ret;
         if (rs.next()) {
            ret = new ArrayList<>();
            do {
               Map<String, Object> one = new LinkedHashMap<>();
               one.put("player", rs.getString("player"));
               one.put("serial", rs.getString("serial"));
               one.put("tried", rs.getInt("tried"));
               one.put("elapsed", rs.getDouble("elapsed"));
               one.put("logdate", rs.getDate("logdate"));
               ret.add(one);
            } while (rs.next());
         } else {
            ret = null;
         }
         conn.close();
         return ret;
      } catch (Exception e) {
         e.printStackTrace();
         return null;
      }
   }


   public int createAccount(String user, String password, String name, String gender) {
      try {
         Connection conn = DriverManager.getConnection(dburl, dbuser, dbpassword);
         String sql = "insert into baseresult values(?, ?, ?, ?)";
         PreparedStatement ps = conn.prepareStatement(sql);
         ps.setString(1, user);
         ps.setString(2, password);
         ps.setString(3, name);
         ps.setString(4, gender);
         int n = ps.executeUpdate(); 
         conn.close();
         return n;
      } catch (Exception e) {
         e.printStackTrace();
         return -1;
      }
   }
   
   public int addData(Map param) {
      try {
         Connection conn = DriverManager.getConnection(dburl, dbuser, dbpassword);
         String sql = "insert into baseresult values(?, ?, ?, ?, ?)";
         PreparedStatement ps = conn.prepareStatement(sql);
         ps.setString(1, (String)param.get("serial"));
         ps.setString(2, (String)param.get("user"));
         ps.setInt(3, (Integer)param.get("tried"));
         ps.setDouble(4, (Double)param.get("elapsed"));
         ps.setDate(5, (Date)param.get("logdate"));
         int n = ps.executeUpdate();
         conn.close();
         return n;
      } catch (Exception e) {
         e.printStackTrace();
         return -1;
      }
   }
   
}