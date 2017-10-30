package kr.gudi.trois.service;

import java.util.HashMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.gudi.trois.dao.workDao;
import kr.gudi.trois.dao.workDaoInterface;


@Service
public class workService implements workServiceInterface {
	
	@Autowired
	workDao work;
	
	public HashMap<String, Object> userselect() {
		HashMap<String, Object> map = (HashMap<String, Object>) work.userselect();
		return map;
	}
}
