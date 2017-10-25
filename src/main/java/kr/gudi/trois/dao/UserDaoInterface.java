package kr.gudi.trois.dao;

import java.util.HashMap;
import java.util.List;

public interface UserDaoInterface {
	public List<HashMap<String, Object>> getData();
	
	public HashMap<String, Object> login(HashMap<String, Object> param);
	public int join(HashMap<String, Object> param);
	public HashMap<String, Object> checkid(HashMap<String, Object> param);
}
