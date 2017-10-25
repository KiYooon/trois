package kr.gudi.trois.dao;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class UserDao implements UserDaoInterface {
	@Resource(name="sqlSession")
	SqlSession session;

	@Override
	public List<HashMap<String, Object>> getData() {
		
		return session.selectList("sql.user");
	}

	@Override
	public HashMap<String, Object> login(HashMap<String, Object> param) {
		
		return session.selectOne("sql.login", param);
	}

	@Override
	public int join(HashMap<String, Object> param) {

		return session.insert("sql.join", param);
	}
	@Override
	public HashMap<String, Object> checkid(HashMap<String, Object> param) {
		
		return session.selectOne("sql.checkid", param);
	}

}
