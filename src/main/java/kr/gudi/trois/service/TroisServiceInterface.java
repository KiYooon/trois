package kr.gudi.trois.service;

import java.util.HashMap;

public interface TroisServiceInterface {
	public HashMap<String, Object> selectMyqna(HashMap<String, Object> param);
	public HashMap<String, Object> selectMyroom(HashMap<String, Object> param);
	public HashMap<String, Object> selectAdmin(HashMap<String, Object> param);
}
