package kr.gudi.trois.dao;

import java.util.HashMap;

public interface qnaDaoInterface {
	public int insertQna(HashMap<String, Object> param);
	public HashMap<String, Object> selectQna(HashMap<String, Object> param);
	public int updateQna(HashMap<String, Object> param);
	public HashMap<String, Object> selectanswer(HashMap<String, Object> param);
	public HashMap<String, Object> userselect();
}
