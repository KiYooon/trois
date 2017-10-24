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

//	@Override
//	public HashMap<String, Object> selectQna() {
//		map = new HashMap<String, Object>();
//		map.put("list", tdi.selectQna());
//		return map;
//	}

	@Override
	public HashMap<String, Object> select(HashMap<String, Object> param) {
		
		List<HashMap<String, Object>> list = tdi.select(param);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("data", list);
		
		HashMap<String, Object> totCnt = tdi.totCnt();
		map.put("totCnt", totCnt);
		
		return map;
	}

}
