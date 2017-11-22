package kr.gudi.trois.dao;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class TestDao implements TestDaoInterface {

   @Resource(name="sqlSession")
   SqlSession session;
   
   @Override
   public HashMap<String, Object> selectOne() {
      return session.selectOne("sql.select");
   }
   
   @Override
	public List<HashMap<String, Object>> selectMyqna(HashMap<String, Object> param) { // Myqna 게시판 목록 불러오기
		return session.selectList("sql.selectMyqna", param);
	}

	@Override
	public HashMap<String, Object> totCntMyqna(HashMap<String, Object> param) { // Myqna 총 데이터 갯수
		return session.selectOne("sql.totCntMyqna",param);
	}
	
	@Override
	public List<HashMap<String, Object>> myqnaDetail(HashMap<String, Object> param) {
		return session.selectList("sql.myqnaDetail", param);
	}
	
	@Override
	public List<HashMap<String, Object>> selectAdmin(HashMap<String, Object> param) { // Admin 게시판 목록 불러오기
		return session.selectList("sql.selectAdmin", param);
	}

	@Override
	public HashMap<String, Object> totCntAdmin() { // Admin 총 데이터 갯수
		return session.selectOne("sql.totCntAdmin");
	}
	
	@Override
	public List<HashMap<String, Object>> selectMyroom(HashMap<String, Object> param) { // Myroom 게시판 목록 불러오기
		return session.selectList("sql.selectMyroom", param);
	}

	@Override
	public HashMap<String, Object> totCntMyroom(HashMap<String, Object> param) { // Myroom 총 데이터 갯수
		return session.selectOne("sql.totCntMyroom", param);
	}
	
	@Override
	public int deleteMyroom(HashMap<String, Object> param) { // Myroom 한 개의 ul 삭제
		return session.update("sql.deleteMyroom", param);
	}

	@Override
	public int deleteAdmin(HashMap<String, Object> param) { // Admin 한 개의 ul 삭제
		return session.update("sql.deleteAdmin", param);
	}
	
	@Override
	public int deleteUser(HashMap<String, Object> param) {
		return session.update("sql.deleteUser", param);
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

	@Override
	public HashMap<String, Object> findid(HashMap<String, Object> param) {
		return session.selectOne("sql.findid", param);
	}

	@Override
	public int updatepw(HashMap<String, Object> param) {
		return session.update("sql.updatepw", param);
	}
	
	@Override
	public int updateEmail(HashMap<String, Object> param) {
		return session.update("sql.updateEmail", param);
	}
	
	@Override
	public int insertqna(HashMap<String, Object> param) {
		return session.insert("sql.insertqna", param);
	}
	
	@Override
	public int updateqna(HashMap<String, Object> param) {
		return session.update("sql.updateqna", param);
	}
}