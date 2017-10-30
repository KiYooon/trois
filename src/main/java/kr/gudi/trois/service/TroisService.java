package kr.gudi.trois.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.gudi.trois.dao.TroisDaoInterface;

@Service
public class TroisService implements TroisServiceInterface {

	@Autowired
	TroisDaoInterface tdi;

	@Override
	public HashMap<String, Object> selectMyqna(HashMap<String, Object> param) {
		List<HashMap<String, Object>> list = tdi.selectMyqna(param);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("data", list);
		
		
		HashMap<String, Object> totCnt = tdi.totCntMyqna(param);
		
		map.put("totCnt", totCnt);
		System.out.println("service map: "+ map);
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
	public HashMap<String, Object> selectAdmin(HashMap<String, Object> param) {
		List<HashMap<String, Object>> list = tdi.selectAdmin(param);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("data", list);
		
		HashMap<String, Object> totCnt = tdi.totCntAdmin();
		map.put("totCnt", totCnt);
		
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
	public HashMap<String, Object> updateMyroom(HashMap<String, Object> param) {
		List<HashMap<String, Object>> list = tdi.updateMyroom(param);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("data", list);
		
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
	public HashMap<String, Object> updatePwd(HashMap<String, Object> param) {
		int pwd = tdi.updatePwd(param);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("pwd", pwd);
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
	public HashMap<String, Object> deleteUser(HashMap<String, Object> param) {
		int id = tdi.deleteUser(param);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		return map;
	}

	@Override
	public HashMap<String, Object> myqnaDetail(HashMap<String, Object> param) {
		List<HashMap<String, Object>> list = tdi.myqnaDetail(param);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("data", list);
		
		return map;
	}

	

	

}
