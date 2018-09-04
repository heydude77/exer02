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


public class MessageDao extends Dao {
	public int addMessage(String code, String sender, String receiver, String content, Date senddate) {
		try {
			Connection conn = DriverManager.getConnection(dburl, dbuser, dbpassword);
			String sql = "insert into message(code, sender, receiver, content, senddate) values(?, ?, ?, ?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, code);
			ps.setString(2, sender);
			ps.setString(3, receiver);
			ps.setString(4, content);
			ps.setDate(5, senddate);
			int n = ps.executeUpdate(); // send → receive 작업을 함.
			conn.close();
			return n;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}

	public List<Map> getMessagesByReceiver(String receiver) {
		try {
			Connection conn = DriverManager.getConnection(dburl, dbuser, dbpassword);
			String sql = "select * from message where receiver=? order by senddate desc";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, receiver);
			ResultSet rs = ps.executeQuery();
			List<Map> ret;
			if (rs.next()) {
				ret = new ArrayList<>();
				do {
					Map one = new LinkedHashMap<>();
					one.put("code", rs.getString("code"));
					one.put("sender", rs.getString("sender"));
					one.put("receiver", rs.getString("receiver"));
					one.put("content", rs.getString("content"));
					one.put("senddate", rs.getDate("senddate"));
					one.put("receivedate", rs.getDate("receivedate"));
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
	
	
	// receivedate update ...

	
	
}







