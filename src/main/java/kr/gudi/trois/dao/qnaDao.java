package kr.gudi.trois.dao;

import java.util.HashMap;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class qnaDao implements qnaDaoInterface {

	@Resource(name="sqlSession")
	SqlSession session;
	
	public HashMap<String, Object> selectQna(HashMap<String, Object> param) {
		return session.selectOne("project.selectqna", param);
	}

	public int insertQna(HashMap<String, Object> param) {
		return session.insert("project.insertqna", param);
	}

	public int updateQna(HashMap<String, Object> param) {
		return session.update("project.updateqna", param);
	}
	
	public HashMap<String, Object> selectanswer(HashMap<String, Object> param){
		return session.selectOne("project.selectanswer", param);
	}

}
