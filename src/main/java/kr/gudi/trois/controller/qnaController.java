package kr.gudi.trois.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.gudi.trois.service.qnaServiceInterface;
import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;


@Controller
public class qnaController {

	
	@Autowired
	qnaServiceInterface qsi;
	
	@RequestMapping(value="/question")
	public ModelAndView question(ModelAndView mav, HttpSession session) {
		HashMap<String, HashMap<String, Object>> user = (HashMap<String, HashMap<String, Object>>) session.getAttribute("user");
		if(user == null){
			mav.setViewName("redirect:/main");
		}else if((user.get("login").get("id")).equals("admin")){
			mav.setViewName("redirect:/admin");
		}else {
			mav.setViewName("question");
		}
		return mav;
	}
	
//	@RequestMapping(value="/questionRead", method=RequestMethod.POST)
//	public ModelAndView questionCheck(ModelAndView mav, HttpServletRequest req, HttpSession session) {
//		HashMap<String, HashMap<String, Object>> user = (HashMap<String, HashMap<String, Object>>) session.getAttribute("user");
//		if(user == null){
//			mav.setViewName("redirect:/main");
//		}else if((user.get("login").get("id")).equals("admin")){
//			mav.setViewName("redirect:/admin");
//		}else {
//			HashMap<String, Object> param = new HashMap<String, Object>();
//			boolean chc = true;
//			if("".equals(req.getParameter("title")) || ("".equals(req.getParameter("contents")))) {
//				chc = false;
//			}
//			if(chc) {
//			param.put("id", user.get("login").get("id"));
//			param.put("title", req.getParameter("title"));
//			param.put("contents", req.getParameter("contents"));
//			// 값 저장 완료
//			
//			param = qsi.insertQna(param);
//			
//			HashMap<String, Object> questionSelect = new HashMap<String, Object>();
//			
//			questionSelect.put("id", user.get("login").get("id"));
//			questionSelect.put("title", req.getParameter("title"));
//			questionSelect.put("contents", req.getParameter("contents"));
//			
//			JSONObject jsonObject = new JSONObject();
//			jsonObject = JSONObject.fromObject(JSONSerializer.toJSON(qsi.selectQna(questionSelect)));
//			
//			mav.addObject("questionSelect", jsonObject.toString());
//			mav.setViewName("questionJSON");
//			return mav;
//			} else {
//				mav.setViewName("question");
//				return mav;
//			}
//		}
//		return mav;
//	}
	
	@RequestMapping("/answer")
	public ModelAndView answer(ModelAndView mav, HttpServletRequest req, HttpSession session) {
		HashMap<String, HashMap<String, Object>> user = (HashMap<String, HashMap<String, Object>>) session.getAttribute("user");
		if(user == null){
			mav.setViewName("redirect:/main");
		}else if(!(user.get("login").get("id")).equals("admin")) {
			mav.setViewName("redirect:/main");
		}else{
			HashMap<String, Object> param = new HashMap<String, Object>();
	
			String answer = req.getParameter("answer");
			
			if(answer == null) {
				param.put("no", req.getParameter("no"));
				param.put("title", req.getParameter("title"));
				param.put("contents", req.getParameter("contents"));
				
				JSONObject jsonObject = new JSONObject();
				jsonObject = JSONObject.fromObject(JSONSerializer.toJSON(qsi.selectQna(param)));
				
				mav.addObject("message", jsonObject.toString());
				mav.setViewName("json");
				return mav;
			}else {
				param.put("no", req.getParameter("no"));
				param.put("title", req.getParameter("title"));
				param.put("contents", req.getParameter("contents"));
				param.put("answer", answer);
				
				JSONObject jsonObject = new JSONObject();
				jsonObject = JSONObject.fromObject(JSONSerializer.toJSON(qsi.selectanswer(param)));
				
				mav.addObject("message", jsonObject.toString());
				mav.setViewName("json");
				return mav;
			}
		}
		return mav;
			
	}
	
//	@RequestMapping(value="/answerRead", method=RequestMethod.POST)
//	public ModelAndView test(ModelAndView mav, HttpServletRequest req, HttpSession session){
//		HashMap<String, HashMap<String, Object>> user = (HashMap<String, HashMap<String, Object>>) session.getAttribute("user");
//		HashMap<String, Object> param = new HashMap<String, Object>();
//		boolean chc = true;
//		
//		if("".equals(req.getParameter("answer"))) {
//			chc = false;
//		}
//		if(chc) {
//		param.put("no", req.getParameter("no"));
//		param.put("title", req.getParameter("title"));
//		param.put("contents", req.getParameter("contents"));
//		param.put("answer", req.getParameter("answer"));
//		
//		HashMap<String, Object> SelectAns = (HashMap<String, Object>)qsi.updateQna(param);
//		
//		SelectAns.put("no", param.get("no"));
//		SelectAns.put("title", param.get("title"));
//		SelectAns.put("contents", param.get("contents"));
//		SelectAns.put("answer", param.get("answer"));
//		
//		JSONObject jsonObject = new JSONObject();
//		jsonObject = JSONObject.fromObject(JSONSerializer.toJSON(qsi.selectanswer(SelectAns)));
//		
//		mav.addObject("message", jsonObject.toString());
//		mav.setViewName("json");
//		return mav;
//		} else {
//			mav.setViewName("admin");
//			return mav;
//		}
//	}
}