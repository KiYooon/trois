package kr.gudi.trois.dao;

import java.util.HashMap;
import java.util.List;

public interface TestDaoInterface {
	public HashMap<String, Object> selectOne();
	public List<HashMap<String, Object>> selectMyqna(HashMap<String, Object> param);
	public HashMap<String, Object> totCntMyqna(HashMap<String, Object> param);
	public List<HashMap<String, Object>> myqnaDetail(HashMap<String, Object> param);
	public List<HashMap<String, Object>> selectAdmin(HashMap<String, Object> param);
	public HashMap<String, Object> totCntAdmin();
	public List<HashMap<String, Object>> selectMyroom(HashMap<String, Object> param);
	public HashMap<String, Object> totCntMyroom(HashMap<String, Object> param);
	public int deleteMyroom(HashMap<String, Object> param);
	public int deleteAdmin(HashMap<String, Object> param);
	public int deleteUser(HashMap<String, Object> param);
	public int updateEmail(HashMap<String, Object> param);
	public HashMap<String, Object> login(HashMap<String, Object> param);
    public int join(HashMap<String, Object> param);
    public HashMap<String, Object> checkid(HashMap<String, Object> param);
    public HashMap<String, Object> findid(HashMap<String, Object> param);
    public int updatepw(HashMap<String, Object> param);
    public int insertqna(HashMap<String, Object> param);
    public int updateqna(HashMap<String, Object> param);

}
