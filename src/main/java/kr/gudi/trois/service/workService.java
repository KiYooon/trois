package kr.gudi.trois.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.gudi.trois.dao.workDao;
import kr.gudi.trois.dao.workDaoInterface;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;


@Service
public class workService implements workServiceInterface {
	
	@Autowired
	workDaoInterface wdi;

	@Override
	public HashMap<String, Object> insertWork(HashMap<String, Object> param) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int cnt = wdi.insertWorksave(param);
		
		if(cnt > 0){
			int noo = 0;
			JSONArray jsonArray = JSONArray.fromObject(param.get("list").toString());
			for(int i = 0; i < jsonArray.size(); i++){
				JSONObject jo = jsonArray.getJSONObject(i);
				System.out.println(jsonArray.getJSONObject(i));
				HashMap<String, Object> data = new HashMap<String, Object>(); 
				data.put("ws_no", 62);
				data.put("class", jo.getString("class1"));
				data.put("src", jo.getString("src"));
				data.put("index", jo.getString("index"));
				noo += wdi.insertWork(data);
			}
			map.put("noo", noo);
			map.put("state", 1);
		}else {
			map.put("state", 0);
		}
		return map;
	}

	@Override
	public HashMap<String, Object> workSelect(HashMap<String, Object> param) {
		 HashMap<String, Object> map = new HashMap<String, Object>();
		 map.put("list", wdi.workSelect(param));
		 map.put("workSave", wdi.worksaveSelect(param));
		return map;
	}

	@Override
	public HashMap<String, Object> updateWork(HashMap<String, Object> param) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int cnt = 0;
		cnt = wdi.deleteWork(param);
		cnt = wdi.updateWorksave(param);
		if(cnt > 0){
			int noo = 0;
			JSONArray jsonArray = JSONArray.fromObject(param.get("list").toString());
			for(int i = 0; i < jsonArray.size(); i++){
				JSONObject jo = jsonArray.getJSONObject(i);
				System.out.println(jsonArray.getJSONObject(i));
				HashMap<String, Object> data = new HashMap<String, Object>(); 
				data.put("ws_no", param.get("ws_no"));
				data.put("class", jo.getString("class1"));
				data.put("src", jo.getString("src"));
				data.put("index", jo.getString("index"));
				noo += wdi.insertOldWork(data);
			}
			map.put("noo", noo);
			map.put("state", 1);
		}else {
			map.put("state", 0);
		}
		return map;
	}
	
}
