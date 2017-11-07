package kr.gudi.trois.dao;

import java.util.HashMap;
import java.util.List;

public interface TroisDaoInterface {
	public List<HashMap<String, Object>> selectMyqna(HashMap<String, Object> param);
	public HashMap<String, Object> totCntMyqna(HashMap<String, Object> param);
	public List<HashMap<String, Object>> selectMyroom(HashMap<String, Object> param);
	public HashMap<String, Object> totCntMyroom(HashMap<String, Object> param);
	public int deleteMyroom(HashMap<String, Object> param);
	public List<HashMap<String, Object>> updateMyroom(HashMap<String, Object> param);
	public List<HashMap<String, Object>> selectAdmin(HashMap<String, Object> param);
	public HashMap<String, Object> totCntAdmin();
	public int deleteAdmin(HashMap<String, Object> param);
	public int updatePwd(HashMap<String, Object> param);
	public int updateEmail(HashMap<String, Object> param);
	public int deleteUser(HashMap<String, Object> param);
	public List<HashMap<String, Object>> myqnaDetail(HashMap<String, Object> param);
	public HashMap<String, Object> selectEmail(HashMap<String, Object> param);
}
