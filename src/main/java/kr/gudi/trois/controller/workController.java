package kr.gudi.trois.controller;




import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import kr.gudi.trois.service.workServiceInterface;
import kr.gudi.util.HttpUtil;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;



@Controller
public class workController {
	
	@Autowired
	workServiceInterface wsi;
	
@RequestMapping(value="/work")
public ModelAndView question(ModelAndView mav, HttpSession session) {
	HashMap<String, HashMap<String, Object>> user = (HashMap<String, HashMap<String, Object>>) session.getAttribute("user");
	HashMap<String, Object> param = new HashMap<String, Object>();
	param.put("id", user.get("login").get("id"));
	mav.setViewName("work");
	return mav;
}

@RequestMapping(value="/workInsert")
public void workInsert(HttpSession session, HttpServletRequest req, HttpServletResponse resp) {
	HashMap<String, Object> param = HttpUtil.getParameterMap(req);
	HashMap<String, HashMap<String, Object>> user = (HashMap<String, HashMap<String, Object>>) session.getAttribute("user");
	param.put("id", user.get("login").get("id"));
	HttpUtil.sendResponceToJson(resp, wsi.insertWork(param));
}



@RequestMapping(value="/workSelect")
public ModelAndView workSelect(ModelAndView mav, HttpSession session) {
	HashMap<String, HashMap<String, Object>> user = (HashMap<String, HashMap<String, Object>>) session.getAttribute("user");
	if(user == null){
		mav.addObject("id", "");
	}else{
		mav.addObject("id", user.get("login").get("id"));
	}
	mav.setViewName("work2");
	return mav;
}

@RequestMapping(value="/workSelectData")
public void workSelectData(HttpSession session, HttpServletRequest req, HttpServletResponse resp) {
	HashMap<String, HashMap<String, Object>> user = (HashMap<String, HashMap<String, Object>>) session.getAttribute("user");
	HashMap<String, Object> param = HttpUtil.getParameterMap(req);
	if(user == null){
		param = new HashMap<String, Object>();
		param.put("state", 0);
	}else{
		param = wsi.workSelect(param);
		param.put("state", 1);
	}
	HttpUtil.sendResponceToJson(resp, param);
}

}