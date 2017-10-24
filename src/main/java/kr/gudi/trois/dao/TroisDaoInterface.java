package kr.gudi.trois.dao;

import java.util.HashMap;
import java.util.List;

public interface TroisDaoInterface {
//	public List<HashMap<String, Object>> selectQna();
	public List<HashMap<String, Object>> select(HashMap<String, Object> param);
	public HashMap<String, Object> totCnt();
}
