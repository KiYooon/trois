package kr.gudi.trois.dao;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class TestDao implements TestDaoInterface {

	@Resource(name = "sqlSession")
	SqlSession session;

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

	@Override
	public HashMap<String, Object> findid(HashMap<String, Object> param) {
		return session.selectOne("sql.findid", param);
	}

	@Override
	public int updatepw(HashMap<String, Object> param) {
		return session.update("sql.updatepw", param);
	}

	@Override
	public int insertqna(HashMap<String, Object> param) {
		return session.insert("list.insertqna", param);
	}

	@Override
	public int updateqna(HashMap<String, Object> param) {
		return session.update("list.updateqna", param);
	}
}