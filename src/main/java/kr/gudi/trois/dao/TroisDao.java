package kr.gudi.trois.dao;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class TroisDao implements TroisDaoInterface {

	@Resource(name = "sqlSession")
	SqlSession session;

	@Override
	public List<HashMap<String, Object>> selectMyqna(HashMap<String, Object> param) {
		return session.selectList("list.selectMyqna", param);
	}

	@Override
	public HashMap<String, Object> totCntMyqna() {
		return session.selectOne("list.totCntMyqna");
	}

	@Override
	public List<HashMap<String, Object>> selectMyroom(HashMap<String, Object> param) {
		return session.selectList("list.selectMyroom", param);
	}

	@Override
	public HashMap<String, Object> totCntMyroom() {
		return session.selectOne("list.totCntMyroom");
	}

	@Override
	public List<HashMap<String, Object>> selectAdmin(HashMap<String, Object> param) {
		return session.selectList("list.selectAdmin", param);
	}

	@Override
	public HashMap<String, Object> totCntAdmin() {
		return session.selectOne("list.totCntAdmin");
	}

}
