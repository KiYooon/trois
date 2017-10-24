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

//	@Override
//	public List<HashMap<String, Object>> selectQna() {
//		return session.selectList("list.myquestion");
//	}

	@Override
	public List<HashMap<String, Object>> select(HashMap<String, Object> param) {
		return session.selectList("paging.select", param);
	}

	@Override
	public HashMap<String, Object> totCnt() {
		return session.selectOne("paging.totCnt");
	}

}
