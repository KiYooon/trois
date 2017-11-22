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
		HashMap<String, Object> param = new HashMap<String, Object>();
		if(user != null){
			param.put("id", user.get("login").get("id"));
		} else {
			param.put("id", "test");
		}
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
		JSONObject jsonObject = new JSONObject();
		jsonObject = JSONObject.fromObject(JSONSerializer.toJSON(tsi.selectMyqna(param)));
		mav.addObject("message", jsonObject.toString());
		
		mav.setViewName("json");
		return mav;
	}
	
	@RequestMapping(value = "/myqnaDetail", method=RequestMethod.POST)
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
	public ModelAndView adminData(ModelAndView mav, HttpServletRequest req, HttpSession session){
		HashMap<String, HashMap<String, Object>> user = (HashMap<String, HashMap<String, Object>>) session.getAttribute("user");
		HashMap<String, Object> param = new HashMap<String, Object>();
		if(user != null){
			param.put("id", user.get("login").get("id"));
		} else {
			param.put("id", "admin");
		}
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
		
		JSONObject jsonObject = new JSONObject();
		jsonObject = JSONObject.fromObject(JSONSerializer.toJSON(tsi.selectAdmin(param)));
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
	
	
	@RequestMapping(value = "/deleteuser", method=RequestMethod.POST)
	public ModelAndView deleteuser(ModelAndView mav, HttpServletRequest req, HttpSession session){
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
		
		mav.setViewName("redirect:/logout");
		return mav;		
	}
	
	
	@RequestMapping(value = "/modifypwd", method=RequestMethod.POST)
	public ModelAndView modifypwd(ModelAndView mav, HttpServletRequest req, HttpSession session, HttpServletResponse resp){
		HashMap<String, HashMap<String, Object>> user = (HashMap<String, HashMap<String, Object>>) session.getAttribute("user");
		if(user == null){
			mav.setViewName("redirect:/main");;
		}
		HashMap<String, Object> param = new HashMap<String, Object>();
		if(user != null){
			param.put("id", user.get("login").get("id"));
		}else {
			param.put("id", "test");
		}
		if(req.getParameter("newpwd1") != null){
			param.put("pwd", req.getParameter("newpwd1"));
		}else{
			param.put("pwd", "1234");
		}
		if(req.getParameter("newpwd2") != null){
			param.put("pwd2", req.getParameter("newpwd2"));
		}else{
			param.put("pwd2", "1234");
		}
		boolean check = true;
		if (("").equals(param.get("pwd"))) {
			check = false;
		}
		if (("").equals(param.get("pwd2"))) {
			check = false;
		}
		if (param.get("pwd2").equals(param.get("pwd"))) {
			if (check) {
				param.put("pwd", param.get("pwd2"));
				
			}else {
				param.put("pwd", null);
			}
			mav.setViewName("modify");
		}else {
			mav.setViewName("modify");
		}
		JSONObject jsonObject = new JSONObject();
		jsonObject = JSONObject.fromObject(JSONSerializer.toJSON(tsi.updatePwd(param)));
		mav.addObject("message", jsonObject.toString());
		return mav;	
	}
	
	@RequestMapping(value = "/modifyemail", method = RequestMethod.POST)
	public ModelAndView modifyemail(ModelAndView mav, HttpServletRequest req, HttpSession session) {
		HashMap<String, HashMap<String, Object>> user = (HashMap<String, HashMap<String, Object>>) session.getAttribute("user");
		if(user == null){
			mav.setViewName("redirect:/main");;
		}
		HashMap<String, Object> param = new HashMap<String, Object>();
		boolean check = true;
		if (param.get("email") == "") {
			check = false;
		}
		if (user != null) {
			param.put("id", user.get("login").get("id"));
		} else {
			param.put("id", "test");
		}
		if (req.getParameter("email") != null) {
			param.put("email", req.getParameter("email"));
		} else {
			param.put("email", "test1234@naver.com");
		}
		return HttpUtil.makeHashToJsonModelAndView(tsi.updateEmail(param));
	}
}
