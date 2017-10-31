package kr.gudi.trois.service;

import java.util.HashMap;
import java.util.List;

import net.sf.json.JSONArray;

public interface workServiceInterface {
	public HashMap<String, Object> insertWork(HashMap<String, Object> param);
	public HashMap<String, Object> workSelect(HashMap<String, Object> param);
	public HashMap<String, Object> updateWork(HashMap<String, Object> param);
}
