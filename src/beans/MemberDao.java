package beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class MemberDao {
	
	String dburl = "jdbc:oracle:thin:@dal.mockingu.com:1521:xe";
	String dbuser = "minwoo";
	String dbpassword = "123";


	 public void createAccount(String user, String password, String name, String gender) {
	      try {
	         Connection conn = DriverManager.getConnection(dburl, dbuser, dbpassword);
	         String sql = "insert into baseresult values(?, ?, ?, ?)";
	         PreparedStatement ps = conn.prepareStatement(sql);
	         ps.setString(1, user);
	         ps.setString(2, password);
	         ps.setString(3, name);
	         ps.setString(4, gender);
	         ps.executeUpdate(); 
	         conn.close();
	        
	      } catch (Exception e) {
	         e.printStackTrace();	    
	      }
	   }
}
