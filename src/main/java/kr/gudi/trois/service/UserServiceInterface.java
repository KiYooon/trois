package kr.gudi.trois.service;

import java.util.HashMap;

public interface UserServiceInterface {
	public HashMap<String, Object> getData();

	public HashMap<String, Object> login(HashMap<String, Object> param);

	public HashMap<String, Object> join(HashMap<String, Object> param);

	public HashMap<String, Object> checkid(HashMap<String, Object> param);

	public HashMap<String, Object> findid(HashMap<String, Object> param);
	
	public HashMap<String, Object> updatepw(HashMap<String, Object> param);
	
	public HashMap<String, Object> checkemail(HashMap<String, Object> param);
	
}