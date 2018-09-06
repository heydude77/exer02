package beans;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MybatisDao {
	SqlSessionFactory factory;

	public MybatisDao() throws IOException {
		SqlSessionFactoryBuilder builder = new SqlSessionFactoryBuilder();
		InputStream is = Resources.getResourceAsStream("mybatis-config.xml");
		factory = builder.build(is);
	}

	public int addBoardResult(Map param) {
		SqlSession sql = factory.openSession(); // JDBC 의 Connect과정
		try {
			int r = sql.insert("board.addDataUsingMap", param);
			if (r == 1)
				sql.commit();
			return r;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}
	
	public void addGood(Number n) {
		SqlSession sql = factory.openSession(); 
		try {
			int r = sql.insert("board.addGood", n);
			if (r == 1)
				sql.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}	
	}

	public List<Map> getAllResult() {
		SqlSession sql = factory.openSession(); // JDBC의 Connect과정
		try {
			// select statement는 두가지 방식으로 호출을 한다.
			// selectOne 기대하는 데이터가 있거나 없거나 ==> resultType
			// selectList 기대하는 데이터의 개수가 여러개 ==> List<resultType>
			List<Map> p = sql.selectList("board.getAllDataUsingMap");
			// selectList로 쓰는 경우엔, 이게 데이터가 없다면 size0 짜리 List 를 반환함.
			return p;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public String getOneResultByNo(Number n) {
		SqlSession sql = factory.openSession(); 
		try {
			String p = sql.selectOne("board.getContent", n);
			return p;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}	
	
	public Map getOneResultByNumber(Number n) {
		SqlSession sql = factory.openSession(); 
		try {
			Map p = sql.selectOne("board.getOneResultByNumber", n);
			return p;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}	

	public Map getOneResult(String s) {
		SqlSession sql = factory.openSession(); // JDBC 의 Connect과정
		try {
			// select statement는 두가지 방식으로 호출을 한다.
			// selectOne (기대하는 데이터가 있거나 없거나), ==> resultType
			// selectList (기대하는 데이터의 개수가 여러개) ==> List<resultType>
			Map p = sql.selectOne("baseresult.getOneDataUsingMap", s);
			// selectOne 으로 쓰는 경우는, 데이터가 없으면 null을 반환함.
			return p;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public int addBaseResult(Map param) {
		SqlSession sql = factory.openSession(); // JDBC 의 Connect과정
		try {
			int r = sql.insert("baseresult.addDataUsingMap", param);
			if (r == 1)
				sql.commit();
			return r;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}
	
	public int addGoodLog (Map map) {
		SqlSession sql = factory.openSession(); 
		try {
			int r = sql.insert("goodlog.setLog", map);
			if (r == 1)
				sql.commit();
			return r;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}	
	
}
