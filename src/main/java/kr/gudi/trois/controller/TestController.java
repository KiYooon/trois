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

import kr.gudi.trois.service.TestServiceInterface;
import kr.gudi.util.HttpUtil;
import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;

@Controller
public class TestController {

	@Autowired
	TestServiceInterface tsi;

	@RequestMapping(value = "/main") // 메인페이지
	public ModelAndView main(ModelAndView mav) {
		mav.setViewName("main");
		return mav;
	}
	
	@RequestMapping(value = "/LoginCheck", method = RequestMethod.POST)
	public void LoginCheck(HttpServletResponse resp, HttpSession session) {
		HashMap<String, Object> user = (HashMap<String, Object>) session.getAttribute("user");
		HashMap<String, Object> map = new HashMap<String, Object>();
		if (user == null) {
			map.put("status", 0);
		} else {
			map.put("status", 1);
		}
		HttpUtil.sendResponceToJson(resp, map);
	}
	
	@RequestMapping("/test")
	public String testService() {
		HashMap<String, Object> map = tsi.selectOne();
		System.out.println(map);
		return "test";
	}

//	@RequestMapping(value = "/myqnaData", method = RequestMethod.POST)
//	public ModelAndView myqnaData(ModelAndView mav, HttpServletRequest req, HttpSession session) {
//		HashMap<String, HashMap<String, Object>> user = (HashMap<String, HashMap<String, Object>>) session.getAttribute("user");
//		HashMap<String, Object> param = new HashMap<String, Object>();
//		if(user != null){
//			param.put("id", user.get("login").get("id"));
//		} else {
//			param.put("id", "test");
//		}
//		if (req.getParameter("start") != null) {
//			param.put("start", Integer.parseInt(req.getParameter("start")));
//		} else {
//			param.put("start", 0);
//		}
//		if (req.getParameter("viewRow") != null) {
//			param.put("viewRow", Integer.parseInt(req.getParameter("viewRow")));
//		} else {
//			param.put("viewRow", 10);
//		}
//		JSONObject jsonObject = new JSONObject();
//		jsonObject = JSONObject.fromObject(JSONSerializer.toJSON(tsi.selectMyqna(param)));
//		mav.addObject("message", jsonObject.toString());
//
//		mav.setViewName("json");
//		return mav;
//	}
	
	@RequestMapping(value = "/myqnaDetail", method=RequestMethod.GET)
	public ModelAndView myqnaDetail(ModelAndView mav, HttpServletRequest req, HttpSession session){
		HashMap<String, HashMap<String, Object>> user = (HashMap<String, HashMap<String, Object>>) session.getAttribute("user");
		HashMap<String, Object> param = new HashMap<String, Object>();
		if(req.getParameter("no") != null) {
			param.put("no", req.getParameter("no"));
		} else {
			param.put("no", 1);
		}if(req.getParameter("title") != null) {
			param.put("title", req.getParameter("title"));
		} else {
			param.put("title", "도구좀...");
		}if(req.getParameter("contents") != null) {
			param.put("contents", req.getParameter("contents"));
		} else {
			param.put("contents", "많이 추가 해주세요");
		}
		if(req.getParameter("answer") != null){
			param.put("answer", req.getParameter("answer"));
		}else {
			param.put("answer", "네 알겠습니다.");
		}
		
		JSONObject jsonObject = new JSONObject();
		jsonObject = JSONObject.fromObject(JSONSerializer.toJSON(tsi.myqnaDetail(param)));
		mav.addObject("message", jsonObject.toString());
		mav.setViewName("json");
		return mav;

	}

	@RequestMapping("/admin")
	public ModelAndView admin(ModelAndView mav, HttpSession session) {
		HashMap<String, HashMap<String, Object>> user = (HashMap<String, HashMap<String, Object>>) session.getAttribute("user");
		if (user == null) {
			mav.setViewName("redirect:/main");
		} else if (!(user.get("login").get("id")).equals("admin")) {
			mav.setViewName("redirect:/main");
		} else {
			mav.setViewName("admin");
		}
		return mav;
	}

	@RequestMapping(value = "/adminData", method=RequestMethod.POST)
	public ModelAndView adminData(ModelAndView mav, HttpServletRequest req, HttpSession session){
		HashMap<String, HashMap<String, Object>> user = (HashMap<String, HashMap<String, Object>>) session.getAttribute("user");
		HashMap<String, Object> param = new HashMap<String, Object>();
		if (req.getParameter("start") != null) {
			param.put("start", Integer.parseInt(req.getParameter("start")));
		} else {
			param.put("start", 0);
		}
		if (req.getParameter("viewRow") != null) {
			param.put("viewRow", Integer.parseInt(req.getParameter("viewRow")));
		} else {
			param.put("viewRow", 10);
		}	
		if(user != null){
			param.put("id", user.get("login").get("id"));
		} else {
			param.put("id", "admin");
		}
		
		JSONObject jsonObject = new JSONObject();
		jsonObject = JSONObject.fromObject(JSONSerializer.toJSON(tsi.selectAdmin(param)));
		mav.addObject("message", jsonObject.toString());
		
		mav.setViewName("json");
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
		HashMap<String, Object> param = new HashMap<String, Object>();
		if (req.getParameter("start") != null) {
			param.put("start", Integer.parseInt(req.getParameter("start")));
		} else {
			param.put("start", 0);
		}
		if (req.getParameter("viewRow") != null) {
			param.put("viewRow", Integer.parseInt(req.getParameter("viewRow")));
		} else {
			param.put("viewRow", 10);
		}
		if (user != null) {
			param.put("id", user.get("login").get("id"));
		} else {
			param.put("id", "test");
		}

		JSONObject jsonObject = new JSONObject();
		jsonObject = JSONObject.fromObject(JSONSerializer.toJSON(tsi.selectMyroom(param)));
		mav.addObject("message", jsonObject.toString());

		mav.setViewName("json");
		return mav;
		
	}
	
	@RequestMapping(value = "/myroomDataDelete", method=RequestMethod.POST)
	public ModelAndView myroomDataDelete(ModelAndView mav, HttpServletRequest req){
		HashMap<String, Object> param = new HashMap<String, Object>();
		if(req.getParameter("no") != null){
			param.put("no", Integer.parseInt(req.getParameter("no")));
		} else {
			param.put("no", 2);
		}
		JSONObject jsonObject = new JSONObject();
		jsonObject = JSONObject.fromObject(JSONSerializer.toJSON(tsi.deleteMyroom(param)));
		mav.addObject("message", jsonObject.toString());
		
		mav.setViewName("json");
		return mav;
	}
	
	@RequestMapping(value = "/adminDataDelete", method=RequestMethod.POST)
	public ModelAndView adminDataDelete(ModelAndView mav, HttpServletRequest req){
		HashMap<String, Object> param = new HashMap<String, Object>();
		if(req.getParameter("no") != null){
			param.put("no", Integer.parseInt(req.getParameter("no")));
		}else {
			param.put("no", 2);
		}
		
		JSONObject jsonObject = new JSONObject();
		jsonObject = JSONObject.fromObject(JSONSerializer.toJSON(tsi.deleteAdmin(param)));
		mav.addObject("message", jsonObject.toString());
		
		mav.setViewName("json");
		return mav;
	}
	
//	@RequestMapping(value = "/Userlogin", method = RequestMethod.POST)
//	public ModelAndView Userlogin(ModelAndView mav, HttpServletRequest req, HttpSession session) {
//
//		HashMap<String, Object> userlogin = new HashMap<String, Object>();
//
//		if (req.getParameter("id") == null || req.getParameter("pwd") == null) {
//			userlogin.put("id", "test");
//			userlogin.put("pwd", "test");
//		} else {
//			userlogin.put("id", req.getParameter("id"));
//			userlogin.put("pwd", req.getParameter("pwd"));
//		}
//
//		HashMap<String, Object> Logindata = (HashMap<String, Object>) tsi.login(userlogin);
//		session.setAttribute("user", Logindata);
//
//		JSONObject jsonObject = new JSONObject();
//		jsonObject = JSONObject.fromObject(JSONSerializer.toJSON(tsi.login(userlogin)));
//		mav.addObject("message", jsonObject.toString());
//
//		mav.setViewName("json");
//		return mav;
//	}
//
//	@RequestMapping(value = "/Userjoin", method = RequestMethod.POST)
//	public ModelAndView Userjoin(ModelAndView mav, HttpServletRequest req, HttpSession session) {
//
//		HashMap<String, Object> createUser = new HashMap<String, Object>();
//
//		if (req.getParameter("id") == null || req.getParameter("pwd") == null || req.getParameter("name") == null
//				|| req.getParameter("email") == null) {
//			createUser.put("id", "kkk");
//			createUser.put("pwd", "123");
//			createUser.put("name", "pky");
//			createUser.put("email", "kiyoon1008@daum.net");
//		} else {
//			createUser.put("id", req.getParameter("id"));
//			createUser.put("pwd", req.getParameter("pwd"));
//			createUser.put("name", req.getParameter("name"));
//			createUser.put("email", req.getParameter("email"));
//		}
//
//		JSONObject jsonObject = new JSONObject();
//		jsonObject = JSONObject.fromObject(JSONSerializer.toJSON(tsi.join(createUser)));
//		mav.addObject("message", jsonObject.toString());
//
//		mav.setViewName("json");
//		return mav;
//
//	}
//	
//	@RequestMapping(value = "/findid", method = RequestMethod.POST)
//	public ModelAndView findid(ModelAndView mav, HttpServletRequest req) {
//		
//		HashMap<String, Object> findid = new HashMap<String, Object>();
//
//		if (req.getParameter("name") == null || req.getParameter("email") == null) {
//			findid.put("name", "test");
//			findid.put("email", "test1@naver.com");
//		} else {
//			findid.put("name", req.getParameter("name"));
//			findid.put("email", req.getParameter("email"));
//
//		}
//		System.out.println(findid);
//
//		JSONObject jsonObject = new JSONObject();
//		jsonObject = JSONObject.fromObject(JSONSerializer.toJSON(tsi.findid(findid)));
//		mav.addObject("message", jsonObject.toString());
//
//		mav.setViewName("json");
//		return mav;
//	}
//	
//	@RequestMapping(value = "/updatepw", method = RequestMethod.POST)
//	public ModelAndView updatepw(ModelAndView mav, HttpServletRequest req) {
//
//		HashMap<String, Object> updatepw = new HashMap<String, Object>();
//
//		if (req.getParameter("id") == null || req.getParameter("name") == null || req.getParameter("pwd") == null) {
//			updatepw.put("id", "test");
//			updatepw.put("name", "test");
//			updatepw.put("pwd", "test");
//
//		} else {
//			updatepw.put("name", req.getParameter("name"));
//			updatepw.put("id", req.getParameter("id"));
//			updatepw.put("pwd", req.getParameter("pwd"));
//
//		}
//		System.out.println(updatepw);
//
//		JSONObject jsonObject = new JSONObject();
//		jsonObject = JSONObject.fromObject(JSONSerializer.toJSON(tsi.updatepw(updatepw)));
//		mav.addObject("message", jsonObject.toString());
//
//		mav.setViewName("json");
//		return mav;
//
//	}
	
	@RequestMapping(value = "/deleteuser", method = RequestMethod.POST)
	public ModelAndView deleteuser(ModelAndView mav, HttpServletRequest req, HttpSession session) {
		HashMap<String, HashMap<String, Object>> user = (HashMap<String, HashMap<String, Object>>) session.getAttribute("user");
		HashMap<String, Object> param = new HashMap<String, Object>();
		if(user != null) {
			param.put("id", user.get("login").get("id"));
		} else {
			param.put("id", "a");
		}
		
		JSONObject jsonObject = new JSONObject();
		jsonObject = JSONObject.fromObject(JSONSerializer.toJSON(tsi.deleteUser(param)));
		mav.addObject("message", jsonObject.toString());
		
		mav.setViewName("json");
		return mav;
	}
	
	@RequestMapping(value = "/modifyemail", method = RequestMethod.POST)
	public ModelAndView modifyemail(ModelAndView mav, HttpServletRequest req, HttpSession session) {

		HashMap<String, Object> emailMap = new HashMap<String, Object>();

		if (req.getParameter("id") == null || req.getParameter("email") == null) {
			emailMap.put("id", "test");
			emailMap.put("email", "test2@naver.com");
		} else {
			emailMap.put("id", req.getParameter("id"));
			emailMap.put("email", req.getParameter("email"));
		}
		System.out.println(emailMap);

		JSONObject jsonObject = new JSONObject();
		jsonObject = JSONObject.fromObject(JSONSerializer.toJSON(tsi.updateEmail(emailMap)));
		mav.addObject("message", jsonObject.toString());

		mav.setViewName("json");
		return mav;
	}
	
	@RequestMapping(value = "/questionRead")
	public ModelAndView questionRead(ModelAndView mav, HttpServletRequest req, HttpSession session) {
		HashMap<String, HashMap<String, Object>> user = (HashMap<String, HashMap<String, Object>>) session.getAttribute("user");
		HashMap<String, Object> param = new HashMap<String, Object>();
		if (user != null) {
			param.put("id", user.get("login").get("id"));
		} else {
			param.put("id", "test");
		}
		if (req.getParameter("title") != null) {
			param.put("title", req.getParameter("title"));
		} else {
			param.put("title", "왜 시험?");
		}
		if (req.getParameter("contents") != null) {
			param.put("contents", req.getParameter("contents"));
		} else {
			param.put("contents", "거 장난이 너무 심한거 아니오?");
		}
		JSONObject jsonObject = new JSONObject();
		jsonObject = JSONObject.fromObject(JSONSerializer.toJSON(tsi.insertqna(param)));
		mav.addObject("message", jsonObject.toString());
		System.out.println(jsonObject);

		mav.setViewName("json");
		return mav;
	}
	
	@RequestMapping("/answerRead")
	public ModelAndView answerRead(ModelAndView mav, HttpServletRequest req, HttpSession session) {
		HashMap<String, HashMap<String, Object>> user = (HashMap<String, HashMap<String, Object>>) session.getAttribute("user");
		HashMap<String, Object> param = new HashMap<String, Object>();
		if (req.getParameter("no") != null) {
			param.put("no", req.getParameter("no"));
		} else {
			param.put("no", 1);
		}
		if (req.getParameter("answer") != null) {
			param.put("answer", req.getParameter("answer"));
		} else {
			param.put("answer", "너무해..");
		}
		if (user != null) {
			param.put("id", user.get("login").get("id"));
		} else {
			param.put("id", "admin");
		}

		JSONObject jsonObject = new JSONObject();
		jsonObject = JSONObject.fromObject(JSONSerializer.toJSON(tsi.updateqna(param)));

		mav.addObject("message", jsonObject.toString());
		mav.setViewName("json");
		return mav;
	}

}
