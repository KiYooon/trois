package kr.gudi.trois.service;

import java.util.HashMap;

public interface TestServiceInterface {
	public HashMap<String, Object> login(HashMap<String, Object> param);
	public HashMap<String, Object> join(HashMap<String, Object> param);
	public HashMap<String, Object> checkid(HashMap<String, Object> param);
	public HashMap<String, Object> findid(HashMap<String, Object> param);
	public HashMap<String, Object> updatepw(HashMap<String, Object> param);
	public HashMap<String, Object> insertqna(HashMap<String, Object> param);
	public HashMap<String, Object> updateqna(HashMap<String, Object> param);
}
