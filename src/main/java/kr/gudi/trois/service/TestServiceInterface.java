package kr.gudi.trois.service;

import java.util.HashMap;

public interface TestServiceInterface {
	public HashMap<String, Object> selectOne();
	public HashMap<String, Object> selectMyqna(HashMap<String, Object> param);
	public HashMap<String, Object> selectAdmin(HashMap<String, Object> param);
	public HashMap<String, Object> selectMyroom(HashMap<String, Object> param);
	public HashMap<String, Object> myqnaDetail(HashMap<String, Object> param);
	public HashMap<String, Object> deleteMyroom(HashMap<String, Object> param);
	public HashMap<String, Object> deleteAdmin(HashMap<String, Object> param);
	public HashMap<String, Object> deleteUser(HashMap<String, Object> param);
	public HashMap<String, Object> updateEmail(HashMap<String, Object> param);
	public HashMap<String, Object> login(HashMap<String, Object> param);
	public HashMap<String, Object> join(HashMap<String, Object> param);
	public HashMap<String, Object> checkid(HashMap<String, Object> param);
	public HashMap<String, Object> findid(HashMap<String, Object> param);
	public HashMap<String, Object> updatepw(HashMap<String, Object> param);
	public HashMap<String, Object> insertqna(HashMap<String, Object> param);
	public HashMap<String, Object> updateqna(HashMap<String, Object> param);
}
