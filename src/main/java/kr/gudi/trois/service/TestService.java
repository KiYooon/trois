package kr.gudi.trois.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.gudi.trois.dao.TestDaoInterface;


@Service
public class TestService implements TestServiceInterface {

	@Autowired
	TestDaoInterface tdi;
	
	@Override
	public HashMap<String, Object> selectOne() {
		return tdi.selectOne();
	}
	
	@Override
	public HashMap<String, Object> selectMyqna(HashMap<String, Object> param) {
		List<HashMap<String, Object>> list = tdi.selectMyqna(param);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("data", list);
		
		
		HashMap<String, Object> totCnt = tdi.totCntMyqna(param);
		
		map.put("totCnt", totCnt);
		return map;
	}
	
	@Override
	public HashMap<String, Object> selectAdmin(HashMap<String, Object> param) {
		List<HashMap<String, Object>> list = tdi.selectAdmin(param);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("data", list);
		
		HashMap<String, Object> totCnt = tdi.totCntAdmin();
		map.put("totCnt", totCnt);
		
		return map;
	}
	
	@Override
	public HashMap<String, Object> selectMyroom(HashMap<String, Object> param) {
		List<HashMap<String, Object>> list = tdi.selectMyroom(param);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("data", list);
		
		HashMap<String, Object> totCnt = tdi.totCntMyroom(param);
		map.put("totCnt", totCnt);
		
		return map;
	}
	
	@Override
	public HashMap<String, Object> myqnaDetail(HashMap<String, Object> param) {
		List<HashMap<String, Object>> list = tdi.myqnaDetail(param);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("data", list);
		
		return map;
	}
	
	@Override
	public HashMap<String, Object> deleteMyroom(HashMap<String, Object> param) {
		int no = tdi.deleteMyroom(param);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("no", no);
		return map;
	}
	
	@Override
	public HashMap<String, Object> deleteAdmin(HashMap<String, Object> param) {
		int no = tdi.deleteAdmin(param);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("no", no);
		return map;
	}

	@Override
	public HashMap<String, Object> deleteUser(HashMap<String, Object> param) {
		int id = tdi.deleteUser(param);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		return map;
	}
	
	// 로그인
	public HashMap<String, Object> map;
	   
    @Override
    public HashMap<String, Object> login(HashMap<String, Object> param){
       map = new HashMap<String, Object>();
       map.put("login", tdi.login(param));
       return map;
    }
    
    @Override
    public HashMap<String, Object> join(HashMap<String, Object> param){
       map = new HashMap<String, Object>();
       map.put("join", tdi.join(param));
       return map;
    }
    
    @Override
    public HashMap<String, Object> checkid(HashMap<String, Object> param){
       map = new HashMap<String, Object>();
       map.put("checkid", tdi.checkid(param));
       return map;
    }
    
    @Override
    public HashMap<String, Object> findid(HashMap<String, Object> param){
       map = new HashMap<String, Object>();
       map.put("findid", tdi.findid(param));
       return map;
    }
    
    @Override
    public HashMap<String, Object> updatepw(HashMap<String, Object> param){
       map = new HashMap<String, Object>();
       map.put("updatepw", tdi.updatepw(param));
       return map;
    }
    
    
	@Override
	public HashMap<String, Object> updateEmail(HashMap<String, Object> param) {
		int email = tdi.updateEmail(param);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("email", email);
		return map;
	}
	
	@Override
	public HashMap<String, Object> insertqna(HashMap<String, Object> param) {
		int insertqna = tdi.insertqna(param);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("insertqna", insertqna);
		return map;
	}
	
	@Override
	public HashMap<String, Object> updateqna(HashMap<String, Object> param) {
		int updateqna = tdi.updateqna(param);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("updateqna", updateqna);
		return map;
	}


}
