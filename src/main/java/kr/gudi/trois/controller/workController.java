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
	workServiceInterface work;
	
@RequestMapping(value="/work")
public ModelAndView question(ModelAndView mav, HttpSession session) {
	HashMap<String, Object> user = (HashMap<String, Object>) work.userselect(); // 로그인 페이지에서 해줘야됨
	session.setAttribute("user", user); // 로그인 페이지에서 해줘야됨
	mav.setViewName("work");
	return mav;
}
}