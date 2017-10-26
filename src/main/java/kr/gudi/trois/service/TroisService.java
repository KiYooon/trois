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
		
		HashMap<String, Object> totCnt = tdi.totCntMyqna();
		map.put("totCnt", totCnt);
		
		return map;
	}

	@Override
	public HashMap<String, Object> selectMyroom(HashMap<String, Object> param) {
		List<HashMap<String, Object>> list = tdi.selectMyroom(param);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("data", list);
		
		HashMap<String, Object> totCnt = tdi.totCntMyroom();
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

}
