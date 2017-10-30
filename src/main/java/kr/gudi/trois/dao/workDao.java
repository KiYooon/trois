package kr.gudi.trois.dao;

import java.util.HashMap;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class workDao implements workDaoInterface {

	@Resource(name="sqlSession")
	SqlSession session;
	
	public HashMap<String, Object> userselect() {
		return session.selectOne("project.userselect");
	}
}