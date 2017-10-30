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
		mav.setViewName("question");
		return mav;
	}
	
	@RequestMapping(value="/questionRead")
	public ModelAndView questionCheck(ModelAndView mav, HttpServletRequest req, HttpSession session) {
		HashMap<String, HashMap<String, Object>> user = (HashMap<String, HashMap<String, Object>>) session.getAttribute("user");
		HashMap<String, Object> param = new HashMap<String, Object>();
		boolean chc = true;
		if("".equals(req.getParameter("title")) || ("".equals(req.getParameter("contents")))) {
			chc = false;
		}
		if(chc) {
		param.put("id", user.get("login").get("id"));
		param.put("title", req.getParameter("title"));
		param.put("contents", req.getParameter("contents"));
		// 값 저장 완료
		
		param = qsi.insertQna(param);
		
		HashMap<String, Object> questionSelect = new HashMap<String, Object>();
		
		questionSelect.put("id", user.get("login").get("id"));
		questionSelect.put("title", req.getParameter("title"));
		questionSelect.put("contents", req.getParameter("contents"));
		
		JSONObject jsonObject = new JSONObject();
		jsonObject = JSONObject.fromObject(JSONSerializer.toJSON(qsi.selectQna(questionSelect)));
		
		mav.addObject("questionSelect", jsonObject.toString());
		mav.setViewName("questionJSON");
		return mav;
		} else {
			mav.setViewName("question");
			return mav;
		}
	}
	
	@RequestMapping("/answer")
	public ModelAndView answer(ModelAndView mav, HttpServletRequest req, HttpSession session) {
		HashMap<String, HashMap<String, Object>> user = (HashMap<String, HashMap<String, Object>>) session.getAttribute("user");
		HashMap<String, Object> param = new HashMap<String, Object>();
		
		param.put("id", user.get("login").get("id"));
		param.put("title", req.getParameter("title"));
		param.put("contents", req.getParameter("contents"));
		
		param = qsi.selectQna(param);
		
		mav.addObject("qnaSelect", param);
		mav.setViewName("answer");
		return mav;
	}
	
	@RequestMapping(value="/answerRead", method = RequestMethod.POST)
	public ModelAndView test(ModelAndView mav, HttpServletRequest req, HttpSession session){
		HashMap<String, Object> user = (HashMap<String, Object>) session.getAttribute("user");
		HashMap<String, Object> param = new HashMap<String, Object>();
		boolean chc = true;
		
		if("".equals(req.getParameter("answer"))) {
			chc = false;
		}
		if(chc) {
		param.put("id", ((JSONObject) user.get("login")).get("id"));
		param.put("title", req.getParameter("title"));
		param.put("contents", req.getParameter("contents"));
		param.put("answer", req.getParameter("answer"));
		
		param = qsi.updateQna(param);
		
		HashMap<String, Object> Selectqna = new HashMap<String, Object>();
		
		Selectqna.put("id", ((JSONObject) user.get("login")).get("id"));
		Selectqna.put("title", req.getParameter("title"));
		Selectqna.put("contents", req.getParameter("contents"));
		Selectqna.put("answer", req.getParameter("answer"));
		
		JSONObject jsonObject = new JSONObject();
		jsonObject = JSONObject.fromObject(JSONSerializer.toJSON(qsi.selectanswer(Selectqna)));
		
		mav.addObject("selectqna", jsonObject.toString());
		mav.setViewName("answerJSON");
		return mav;
		} else {
			mav.setViewName("answer");
			return mav;
		}
	}
	
	@RequestMapping(value="/okquestion")
	public ModelAndView okquestion(ModelAndView mav, HttpServletRequest req, HttpSession session) {
		HashMap<String, Object> user = (HashMap<String, Object>) session.getAttribute("user");
		
		String id = user.get("id").toString();
		String title = req.getParameter("title");
		String contents = req.getParameter("contents");
		String answer = req.getParameter("answer");
		
		HashMap<String, Object> selectqnaAll = new HashMap<String, Object>();
		
		selectqnaAll.put("id", id);
		selectqnaAll.put("title", title);
		selectqnaAll.put("contents", contents);
		selectqnaAll.put("answer", answer);
		
		selectqnaAll = qsi.selectanswer(selectqnaAll);
		
		mav.addObject("selectqnaAll", selectqnaAll);
		mav.setViewName("okquestion");
		return mav;
	}
}