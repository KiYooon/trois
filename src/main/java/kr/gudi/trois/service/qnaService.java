package kr.gudi.trois.service;

import java.util.HashMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.gudi.trois.dao.qnaDaoInterface;


@Service
public class qnaService implements qnaServiceInterface {

	@Autowired
	qnaDaoInterface qdi;
	
	public HashMap<String, Object> selectQna(HashMap<String, Object> param) {
		HashMap<String, Object> map = (HashMap<String, Object>) qdi.selectQna(param);
		return map;
	}

	public HashMap<String, Object> insertQna(HashMap<String, Object> param) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("insert", qdi.insertQna(param));
		return map;
	}

	public HashMap<String, Object> updateQna(HashMap<String, Object> param) {
		HashMap<String,Object> map = new HashMap<String, Object>();
		map.put("update", qdi.updateQna(param));
		return map;
	}
	
	public HashMap<String, Object> selectanswer(HashMap<String, Object> param){
		HashMap<String, Object> map = (HashMap<String, Object>) qdi.selectanswer(param);
		return map;
	}

	public HashMap<String, Object> userselect() {
		HashMap<String, Object> map = (HashMap<String, Object>) qdi.userselect();
		return map;
	}
}