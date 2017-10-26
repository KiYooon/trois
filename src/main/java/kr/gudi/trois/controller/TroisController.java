package kr.gudi.trois.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.gudi.trois.service.TroisServiceInterface;
import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;

@Controller
public class TroisController {

	@Autowired
	TroisServiceInterface tsi;

	@RequestMapping("/myqna")
	public ModelAndView myqna(ModelAndView mav, HttpSession session) {
		HashMap<String, HashMap<String, Object>> user = (HashMap<String, HashMap<String, Object>>) session.getAttribute("user");
		mav.setViewName("myqna");
		return mav;
	}

	@RequestMapping("/myqnaData")
	public ModelAndView myqnaData(ModelAndView mav, HttpServletRequest req){
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("start", Integer.parseInt(req.getParameter("start")));
		param.put("viewRow", Integer.parseInt(req.getParameter("viewRow")));		
		
		// 디비에서 받아온 hashmpa 데이터를 json으로 변경하여 model 값으로 넣어 준다.
		JSONObject jsonObject = new JSONObject();
		jsonObject = JSONObject.fromObject(JSONSerializer.toJSON(tsi.selectMyqna(param)));
		mav.addObject("message", jsonObject.toString());
		
		mav.setViewName("json");
		return mav;
	}
	
	@RequestMapping("/myroom")
	public ModelAndView myroom(ModelAndView mav, HttpSession session) {
//		HashMap<String, HashMap<String, Object>> user = (HashMap<String, HashMap<String, Object>>) session.getAttribute("user");
		mav.setViewName("myroom");
		return mav;
	}

	@RequestMapping("/myroomData")
	public ModelAndView myroomData(ModelAndView mav, HttpServletRequest req){
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("start", Integer.parseInt(req.getParameter("start")));
		param.put("viewRow", Integer.parseInt(req.getParameter("viewRow")));		
		
		// 디비에서 받아온 hashmpa 데이터를 json으로 변경하여 model 값으로 넣어 준다.
		JSONObject jsonObject = new JSONObject();
		jsonObject = JSONObject.fromObject(JSONSerializer.toJSON(tsi.selectMyroom(param)));
		mav.addObject("message", jsonObject.toString());
		
		mav.setViewName("json");
		return mav;
	}
	
	@RequestMapping("/admin")
	public ModelAndView admin(ModelAndView mav, HttpSession session) {
//		HashMap<String, HashMap<String, Object>> user = (HashMap<String, HashMap<String, Object>>) session.getAttribute("user");
		mav.setViewName("admin");
		return mav;
	}

	@RequestMapping("/adminData")
	public ModelAndView listData(ModelAndView mav, HttpServletRequest req){
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("start", Integer.parseInt(req.getParameter("start")));
		param.put("viewRow", Integer.parseInt(req.getParameter("viewRow")));		
		
		// 디비에서 받아온 hashmpa 데이터를 json으로 변경하여 model 값으로 넣어 준다.
		JSONObject jsonObject = new JSONObject();
		jsonObject = JSONObject.fromObject(JSONSerializer.toJSON(tsi.selectAdmin(param)));
		mav.addObject("message", jsonObject.toString());
		
		mav.setViewName("json");
		return mav;
	}
	
	@RequestMapping("/modify")
	public ModelAndView modify(ModelAndView mav, HttpSession session) {
//		HashMap<String, HashMap<String, Object>> user = (HashMap<String, HashMap<String, Object>>) session.getAttribute("user");
		mav.setViewName("modify");
		return mav;
	}
	
	
}
