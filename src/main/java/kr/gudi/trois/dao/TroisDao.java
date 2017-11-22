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
	public List<HashMap<String, Object>> selectMyqna(HashMap<String, Object> param) { // Myqna 게시판 목록 불러오기
		return session.selectList("list.selectMyqna", param);
	}

	@Override
	public HashMap<String, Object> totCntMyqna(HashMap<String, Object> param) { // Myqna 총 데이터 갯수
		return session.selectOne("list.totCntMyqna",param);
	}

	@Override
	public List<HashMap<String, Object>> selectMyroom(HashMap<String, Object> param) { // Myroom 게시판 목록 불러오기
		return session.selectList("list.selectMyroom", param);
	}

	@Override
	public HashMap<String, Object> totCntMyroom(HashMap<String, Object> param) { // Myroom 총 데이터 갯수
		return session.selectOne("list.totCntMyroom", param);
	}
	
	@Override
	public int deleteMyroom(HashMap<String, Object> param) { // Myroom 한 개의 ul 삭제
		return session.update("list.deleteMyroom", param);
	}

	@Override
	public List<HashMap<String, Object>> selectAdmin(HashMap<String, Object> param) { // Admin 게시판 목록 불러오기
		return session.selectList("list.selectAdmin", param);
	}

	@Override
	public HashMap<String, Object> totCntAdmin() { // Admin 총 데이터 갯수
		return session.selectOne("list.totCntAdmin");
	}

	@Override
	public int deleteAdmin(HashMap<String, Object> param) { // Admin 한 개의 ul 삭제
		return session.update("list.deleteAdmin", param);
	}

	@Override
	public int updatePwd(HashMap<String, Object> param) {
		return session.update("list.updatePwd", param);
	}

	@Override
	public int updateEmail(HashMap<String, Object> param) {
		return session.update("list.updateEmail", param);
	}

	@Override
	public int deleteUser(HashMap<String, Object> param) {
		return session.update("list.deleteUser", param);
	}

	@Override
	public List<HashMap<String, Object>> myqnaDetail(HashMap<String, Object> param) {
		return session.selectList("list.myqnaDetail", param);
	}


}
