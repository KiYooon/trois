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
