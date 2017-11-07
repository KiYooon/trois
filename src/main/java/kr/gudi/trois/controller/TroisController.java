package kr.gudi.trois.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.gudi.trois.service.TroisServiceInterface;
import kr.gudi.util.HttpUtil;
import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;

@Controller
public class TroisController {

	@Autowired
	TroisServiceInterface tsi;

	@RequestMapping("/myqna")
	public ModelAndView myqna(ModelAndView mav, HttpSession session) {
		HashMap<String, HashMap<String, Object>> user = (HashMap<String, HashMap<String, Object>>) session.getAttribute("user");
		if(user == null){
			mav.setViewName("redirect:/main");
		}else if((user.get("login").get("id")).equals("admin")){
			mav.setViewName("redirect:/admin");
		}else {
			mav.setViewName("myqna");
		}
		return mav;
	}

	@RequestMapping(value = "/myqnaData", method=RequestMethod.POST)
	public ModelAndView myqnaData(ModelAndView mav, HttpServletRequest req, HttpSession session){
		HashMap<String, HashMap<String, Object>> user = (HashMap<String, HashMap<String, Object>>) session.getAttribute("user");
		if(user == null){
			mav.setViewName("redirect:/main");
		}else if((user.get("login").get("id")).equals("admin")){
			mav.setViewName("redirect:/admin");
		}else {
			HashMap<String, Object> param = new HashMap<String, Object>();
			param.put("start", Integer.parseInt(req.getParameter("start")));
			param.put("viewRow", Integer.parseInt(req.getParameter("viewRow")));
			param.put("id", user.get("login").get("id"));
			// 디비에서 받아온 hashmap 데이터를 json으로 변경하여 model 값으로 넣어 준다.
			JSONObject jsonObject = new JSONObject();
			jsonObject = JSONObject.fromObject(JSONSerializer.toJSON(tsi.selectMyqna(param)));
			mav.addObject("message", jsonObject.toString());
			
			mav.setViewName("json");
			return mav;
		}
		return mav;
	}
	
	@RequestMapping(value = "/myqnaDetail", method=RequestMethod.POST)
	public ModelAndView myqnaDetail(ModelAndView mav, HttpServletRequest req, HttpSession session){
		HashMap<String, HashMap<String, Object>> user = (HashMap<String, HashMap<String, Object>>) session.getAttribute("user");
		if(user == null){
			mav.setViewName("redirect:/main");
		}else if((user.get("login").get("id")).equals("admin")){
			mav.setViewName("redirect:/admin");
		}else {
			HashMap<String, Object> param = new HashMap<String, Object>();
			param.put("no", req.getParameter("no"));
			param.put("title", req.getParameter("title"));
			param.put("contents", req.getParameter("contents"));
			param.put("answer", req.getParameter("answer"));
			System.out.println(param);
			// 디비에서 받아온 hashmap 데이터를 json으로 변경하여 model 값으로 넣어 준다.
			JSONObject jsonObject = new JSONObject();
			jsonObject = JSONObject.fromObject(JSONSerializer.toJSON(tsi.myqnaDetail(param)));
			mav.addObject("message", jsonObject.toString());
			mav.setViewName("json");
			return mav;
		}
		return mav;
	}
	
	@RequestMapping("/myroom")
	public ModelAndView myroom(ModelAndView mav, HttpSession session) {
		HashMap<String, HashMap<String, Object>> user = (HashMap<String, HashMap<String, Object>>) session.getAttribute("user");
		if(user == null){
			mav.setViewName("redirect:/main");
		}else if((user.get("login").get("id")).equals("admin")){
			mav.setViewName("redirect:/admin");
		}else {
			mav.setViewName("myroom");
		}
		return mav;
	}

	@RequestMapping(value = "/myroomData", method=RequestMethod.POST)
	public ModelAndView myroomData(ModelAndView mav, HttpServletRequest req, HttpSession session){
		HashMap<String, HashMap<String, Object>> user = (HashMap<String, HashMap<String, Object>>) session.getAttribute("user");
		if(user == null){
			mav.setViewName("redirect:/main");
		}else if((user.get("login").get("id")).equals("admin")){
			mav.setViewName("redirect:/admin");
		}else {
			HashMap<String, Object> param = new HashMap<String, Object>();
			param.put("start", Integer.parseInt(req.getParameter("start")));
			param.put("viewRow", Integer.parseInt(req.getParameter("viewRow")));
			param.put("id", user.get("login").get("id"));
			
			// 디비에서 받아온 hashmap 데이터를 json으로 변경하여 model 값으로 넣어 준다.
			JSONObject jsonObject = new JSONObject();
			jsonObject = JSONObject.fromObject(JSONSerializer.toJSON(tsi.selectMyroom(param)));
			mav.addObject("message", jsonObject.toString());
			
			mav.setViewName("json");
			return mav;
		}
		return mav;
	}
	
	@RequestMapping(value = "/myroomDataDelete", method=RequestMethod.POST)
	public ModelAndView myroomDataDelete(ModelAndView mav, HttpServletRequest req){
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("no", Integer.parseInt(req.getParameter("no")));
		System.out.println(param);
		// 디비에서 받아온 hashmap 데이터를 json으로 변경하여 model 값으로 넣어 준다.
		JSONObject jsonObject = new JSONObject();
		jsonObject = JSONObject.fromObject(JSONSerializer.toJSON(tsi.deleteMyroom(param)));
		mav.addObject("message", jsonObject.toString());
		
		mav.setViewName("json");
		return mav;
	}
	
	@RequestMapping(value = "/myroomDataUpdate", method=RequestMethod.POST)
	public ModelAndView myroomDataUpdate(ModelAndView mav, HttpServletRequest req){
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("no", Integer.parseInt(req.getParameter("no")));
		System.out.println(param);
		// 디비에서 받아온 hashmap 데이터를 json으로 변경하여 model 값으로 넣어 준다.
		JSONObject jsonObject = new JSONObject();
		jsonObject = JSONObject.fromObject(JSONSerializer.toJSON(tsi.updateMyroom(param)));
		mav.addObject("message", jsonObject.toString());
		
		mav.setViewName("json");
		return mav;
	}
	
	@RequestMapping("/admin")
	public ModelAndView admin(ModelAndView mav, HttpSession session) {
		HashMap<String, HashMap<String, Object>> user = (HashMap<String, HashMap<String, Object>>) session.getAttribute("user");
		if(user == null){
			mav.setViewName("redirect:/main");
		}else if(!(user.get("login").get("id")).equals("admin")) {
			mav.setViewName("redirect:/main");
		}else{
			mav.setViewName("admin");
		}
		return mav;
	}

	@RequestMapping(value = "/adminData", method=RequestMethod.POST)
	public ModelAndView listData(ModelAndView mav, HttpServletRequest req, HttpSession session){
		HashMap<String, HashMap<String, Object>> user = (HashMap<String, HashMap<String, Object>>) session.getAttribute("user");
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("start", Integer.parseInt(req.getParameter("start")));
		param.put("viewRow", Integer.parseInt(req.getParameter("viewRow")));		
		param.put("id", user.get("login").get("id"));
		
		// 디비에서 받아온 hashmap 데이터를 json으로 변경하여 model 값으로 넣어 준다.
		JSONObject jsonObject = new JSONObject();
		jsonObject = JSONObject.fromObject(JSONSerializer.toJSON(tsi.selectAdmin(param)));
		mav.addObject("message", jsonObject.toString());
		
		mav.setViewName("json");
		return mav;
	}
	
	@RequestMapping(value = "/adminDataDelete", method=RequestMethod.POST)
	public ModelAndView adminDataDelete(ModelAndView mav, HttpServletRequest req){
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("no", Integer.parseInt(req.getParameter("no")));
		System.out.println(param);
		// 디비에서 받아온 hashmap 데이터를 json으로 변경하여 model 값으로 넣어 준다.
		JSONObject jsonObject = new JSONObject();
		jsonObject = JSONObject.fromObject(JSONSerializer.toJSON(tsi.deleteAdmin(param)));
		mav.addObject("message", jsonObject.toString());
		
		mav.setViewName("json");
		return mav;
	}
	
	
	@RequestMapping("/modify")
	public ModelAndView modify(ModelAndView mav, HttpSession session) {
		HashMap<String, HashMap<String, Object>> user = (HashMap<String, HashMap<String, Object>>) session.getAttribute("user");
		if(user == null){
			mav.setViewName("redirect:/main");
		}else if((user.get("login").get("id")).equals("admin")){
			mav.setViewName("redirect:/admin");
		}else {
			mav.setViewName("modify");
		}
		return mav;
	}
	
	@RequestMapping(value = "/modifypwd", method=RequestMethod.POST)
	public ModelAndView modifypwd(ModelAndView mav, HttpServletRequest req, HttpSession session, HttpServletResponse resp){
		HashMap<String, HashMap<String, Object>> user = (HashMap<String, HashMap<String, Object>>) session.getAttribute("user");
		if(user == null){
			mav.setViewName("redirect:/main");
		}else if((user.get("login").get("id")).equals("admin")){
			mav.setViewName("redirect:/admin");
		}else {
			HashMap<String, Object> param = new HashMap<String, Object>();
			param.put("id", user.get("login").get("id"));
			param.put("pwd", req.getParameter("newpwd1"));
			param.put("pwd2", req.getParameter("newpwd2"));
			System.out.println(req.getParameter("newpwd1"));
			System.out.println(req.getParameter("newpwd2"));
			param.put("id", user.get("login").get("id"));
			System.out.println(user.get("login").get("id"));
			boolean check = true;
			if (("").equals(param.get("pwd"))) {
				System.out.println("1 비번이 없다.");
				check = false;
			}
			if (("").equals(param.get("pwd2"))) {
				System.out.println("2 비번이 없다.");
				check = false;
			}
			if (param.get("pwd2").equals(param.get("pwd"))) {
				if (check) {
					param.put("pwd", param.get("pwd"));
				}else {
					param.put("pwd", null);
				}
				param = tsi.updatePwd(param);
				System.out.println(param);
				if (user.get("login").get("id") == null) {
					mav.setViewName("redirect:/main");
				}else {
					mav.setViewName("modify");
				}
			}else {
				mav.setViewName("modify");
			}
	//		// 디비에서 받아온 hashmap 데이터를 json으로 변경하여 model 값으로 넣어 준다.
	//		JSONObject jsonObject = new JSONObject();
	//		jsonObject = JSONObject.fromObject(JSONSerializer.toJSON(tsi.updatePwd(param)));
	//		mav.addObject("message", jsonObject.toString());
	//		
	//		mav.setViewName("json");
			return mav;	
		}
		return mav;
	}
	
	@RequestMapping(value = "/modifyemail", method=RequestMethod.POST)
	public ModelAndView modifyemail(ModelAndView mav, HttpServletRequest req, HttpSession session){
		HashMap<String, HashMap<String, Object>> user = (HashMap<String, HashMap<String, Object>>) session.getAttribute("user");
		if(user == null){
			mav.setViewName("redirect:/main");
		}else if((user.get("login").get("id")).equals("admin")){
			mav.setViewName("redirect:/admin");
		}else {
			HashMap<String, Object> param = new HashMap<String, Object>();
			param.put("email", req.getParameter("email"));
			param.put("id", user.get("login").get("id"));
			boolean check = true;
			if (("").equals(param.get("email"))) {
				System.out.println("이메일이 없습니다.");
				check = false;
			}
			System.out.println(check);
			if(check){
				param.put("id", user.get("login").get("id"));
				param = tsi.updateEmail(param);
				HashMap<String, Object> emailMap = new HashMap<String, Object>();
				emailMap.put("id", user.get("login").get("id"));
				emailMap.put("email", req.getParameter("email"));
				System.out.println(emailMap);
				JSONObject jsonObject = new JSONObject();
				jsonObject = JSONObject.fromObject(JSONSerializer.toJSON(tsi.selectEmail(emailMap)));
				mav.addObject("message", jsonObject.toString());
				System.out.println(jsonObject);
				mav.setViewName("json");
				return mav;
			}
//			if (user.get("login").get("id") == null) {
//				mav.setViewName("redirect:/main");
//			}else {
//				mav.setViewName("modify");
//			}
			
	//		
	//		mav.setViewName("json");
		}
		return mav;
	}
	
	@RequestMapping(value = "/deleteuser", method=RequestMethod.POST)
	public ModelAndView deleteuser(ModelAndView mav, HttpServletRequest req, HttpSession session){
		HashMap<String, HashMap<String, Object>> user = (HashMap<String, HashMap<String, Object>>) session.getAttribute("user");
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("id", user.get("login").get("id"));
		param = tsi.deleteUser(param);
		if (user.get("login").get("id") == null) {
			mav.setViewName("redirect:/main");
		}else{
			mav.setViewName("redirect:/logout");
		}
//		// 디비에서 받아온 hashmap 데이터를 json으로 변경하여 model 값으로 넣어 준다.
//		JSONObject jsonObject = new JSONObject();
//		jsonObject = JSONObject.fromObject(JSONSerializer.toJSON(tsi.updatePwd(param)));
//		mav.addObject("message", jsonObject.toString());
//		
//		mav.setViewName("json");
		return mav;		
	}
}
