package kr.gudi.trois.dao;

import java.util.HashMap;
import java.util.List;

public interface workDaoInterface {
	public int insertWorksave(HashMap<String, Object> param);
	public int updateWorksave(HashMap<String, Object> param);
	public int insertWork(HashMap<String, Object> param);
	public int insertOldWork(HashMap<String, Object> param);
	public int deleteWork(HashMap<String, Object> param);
	public List<HashMap<String, Object>> workSelect(HashMap<String, Object> param);
	public HashMap<String, Object> worksaveSelect(HashMap<String, Object> param);
}
