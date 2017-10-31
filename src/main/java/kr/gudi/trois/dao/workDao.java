package kr.gudi.trois.dao;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class workDao implements workDaoInterface {

	@Resource(name="sqlSession")
	SqlSession session;

	@Override
	public int insertWorksave(HashMap<String, Object> param) {
		return session.insert("list.worksaveInsert", param);
	}

	@Override
	public int insertWork(HashMap<String, Object> param) {
		return session.insert("list.workInsert", param);
	}

	@Override
	public List<HashMap<String, Object>> workSelect(HashMap<String, Object> param) {
		return session.selectList("list.workSelect", param);
	}

	@Override
	public HashMap<String, Object> worksaveSelect(HashMap<String, Object> param) {
		return session.selectOne("list.worksaveSelect", param);
	}

	@Override
	public int deleteWork(HashMap<String, Object> param) {
		return session.delete("list.workDelete", param);
	}

	@Override
	public int insertOldWork(HashMap<String, Object> param) {
		return session.insert("list.workOldInsert", param);
	}

	@Override
	public int updateWorksave(HashMap<String, Object> param) {
		return session.update("list.worksaveUpdate", param);
	}
	
}