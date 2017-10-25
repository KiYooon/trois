package kr.gudi.trois.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.gudi.trois.dao.UserDaoInterface;

@Service
public class UserService implements UserServiceInterface {
	@Autowired
	UserDaoInterface udi;
	
	public HashMap<String, Object> map;
	
	@Override
	public HashMap<String, Object> getData(){
		map = new HashMap<String, Object>();
		map.put("list", udi.getData());
		return map;
	}
	
	@Override
	public HashMap<String, Object> login(HashMap<String, Object> param){
		map = new HashMap<String, Object>();
		map.put("login", udi.login(param));
		return map;
	}
	
	@Override
	public HashMap<String, Object> join(HashMap<String, Object> param){
		map = new HashMap<String, Object>();
		map.put("join", udi.join(param));
		return map;
	}
	@Override
	public HashMap<String, Object> checkid(HashMap<String, Object> param){
		map = new HashMap<String, Object>();
		map.put("checkid", udi.checkid(param));
		return map;
	}
}
