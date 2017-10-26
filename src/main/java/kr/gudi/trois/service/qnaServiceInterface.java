package kr.gudi.trois.service;

import java.util.HashMap;


public interface qnaServiceInterface {
	public HashMap<String, Object> insertQna(HashMap<String, Object> param);
	public HashMap<String, Object> selectQna(HashMap<String, Object> param);
	public HashMap<String, Object> updateQna(HashMap<String, Object> param);
	public HashMap<String, Object> selectanswer(HashMap<String, Object> param);
	
	public HashMap<String, Object> userselect();
}
