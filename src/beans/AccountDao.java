package beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.LinkedHashMap;
import java.util.Map;

public class AccountDao extends Dao {
	public int addAccount(String id, String pass, String name, String gender) {
		try {
			Connection conn = DriverManager.getConnection(dburl, dbuser, dbpassword);
			String sql = "insert into account values(?, ?, ?, ?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, pass);
			ps.setString(3, name);
			ps.setString(4, gender);
			int n = ps.executeUpdate(); // send → receive 작업을 함.
			conn.close();
			return n;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}

	public Map getAccountById(String id) {
		try {
			Connection conn = DriverManager.getConnection(dburl, dbuser, dbpassword);
			String sql = "select * from account where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			Map<String, Object> ret;
			if (rs.next()) {
				ret = new LinkedHashMap<>();
				ret.put("id", rs.getString("id"));
				ret.put("pass", rs.getString("pass"));
				ret.put("name", rs.getString("name"));
				ret.put("gender", rs.getString("gender"));
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

	public int setOnesPass(String id, String newPass) {
		try {
			Connection conn = DriverManager.getConnection(dburl, dbuser, dbpassword);
			String sql = "update account set pass=? where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, newPass);
			ps.setString(2, id);
			int n = ps.executeUpdate(); // send → receive 작업을 함.
			conn.close();
			return n;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}
	
}
