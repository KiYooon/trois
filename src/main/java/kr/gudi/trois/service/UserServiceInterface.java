package kr.gudi.trois.service;

import java.util.HashMap;

public interface UserServiceInterface {
	public HashMap<String, Object> getData();
	
    public HashMap<String, Object> login(HashMap<String, Object> param);
    public HashMap<String, Object> join(HashMap<String, Object> param);
}
