package kr.gudi.trois.service;

import java.util.HashMap;

public interface TroisServiceInterface {
	public HashMap<String, Object> selectMyqna(HashMap<String, Object> param);
	public HashMap<String, Object> selectMyroom(HashMap<String, Object> param);
	public HashMap<String, Object> deleteMyroom(HashMap<String, Object> param);
	public HashMap<String, Object> selectAdmin(HashMap<String, Object> param);
	public HashMap<String, Object> deleteAdmin(HashMap<String, Object> param);
	public HashMap<String, Object> updatePwd(HashMap<String, Object> param);
	public HashMap<String, Object> updateEmail(HashMap<String, Object> param);
	public HashMap<String, Object> deleteUser(HashMap<String, Object> param);
	public HashMap<String, Object> myqnaDetail(HashMap<String, Object> param);
	
}
