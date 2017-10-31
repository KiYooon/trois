package kr.gudi.trois.controller;




import java.util.HashMap;

import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import kr.gudi.trois.service.workServiceInterface;



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
}