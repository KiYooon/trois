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
		HashMap<String, Object> user = (HashMap<String, Object>) qsi.userselect(); // 로그인 페이지에서 해줘야됨
		session.setAttribute("user", user); // 로그인 페이지에서 해줘야됨
		mav.setViewName("question");
		return mav;
	}
	
	@RequestMapping(value="/questionRead")
	public ModelAndView questionCheck(ModelAndView mav, HttpServletRequest req, HttpSession session) {
		HashMap<String, Object> user = (HashMap<String, Object>) session.getAttribute("user"); //가져오는거
		
		String id = user.get("id").toString();
		String title = req.getParameter("title");
		String contents = req.getParameter("contents");
		
		HashMap<String, Object> questionInsert = new HashMap<String, Object>();
		
		questionInsert.put("id", id);
		questionInsert.put("title", title);
		questionInsert.put("contents", contents);
		// 값 저장 완료
		
		questionInsert = qsi.insertQna(questionInsert);
		
		HashMap<String, Object> questionSelect = new HashMap<String, Object>();
		
		questionSelect.put("id", id);
//		questionSelect.put("title", title);
//		questionSelect.put("contents", contents);
		
		JSONObject jsonObject = new JSONObject();
		jsonObject = JSONObject.fromObject(JSONSerializer.toJSON(qsi.selectQna(questionSelect)));
		
		mav.addObject("questionSelect", jsonObject.toString());
		mav.setViewName("questionJSON");
		return mav;
	}
	
	@RequestMapping("/answer")
	public ModelAndView answer(ModelAndView mav, HttpServletRequest req, HttpSession session) {
		HashMap<String, Object> user = (HashMap<String, Object>) session.getAttribute("user"); //가져오는거
		
		String id = user.get("id").toString();
		String title = req.getParameter("title");
		String contents = req.getParameter("contents");
		
		HashMap<String, Object> requestSelect = new HashMap<String, Object>();
		
		requestSelect.put("id", id);
		requestSelect.put("title", title);
		requestSelect.put("contents", contents);
		
		requestSelect = qsi.selectQna(requestSelect);
		
		mav.addObject("qnaSelect", requestSelect);
		mav.setViewName("answer");
		return mav;
	}
	
	@RequestMapping(value="/answerRead", method = RequestMethod.POST)
	public ModelAndView test(ModelAndView mav, HttpServletRequest req, HttpSession session){
		HashMap<String, Object> user = (HashMap<String, Object>) session.getAttribute("user");
		
		String id = user.get("id").toString();
		String title = req.getParameter("title");
		String contents = req.getParameter("contents");
		String answer = req.getParameter("answer");
		
		HashMap<String, Object> updateAnswer = new HashMap<String, Object>();
		
		updateAnswer.put("id", id);
		updateAnswer.put("title", title);
		updateAnswer.put("contents", contents);
		updateAnswer.put("answer", answer);
		
		updateAnswer = qsi.updateQna(updateAnswer);
		
		HashMap<String, Object> Selectqna = new HashMap<String, Object>();
		
		Selectqna.put("id", id);
		Selectqna.put("title", title);
		Selectqna.put("contents", contents);
		Selectqna.put("answer", answer);
		
		JSONObject jsonObject = new JSONObject();
		jsonObject = JSONObject.fromObject(JSONSerializer.toJSON(qsi.selectanswer(Selectqna)));
		
		mav.addObject("selectqna", jsonObject.toString());
		mav.setViewName("answerJSON");
		return mav;
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