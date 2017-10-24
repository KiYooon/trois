package kr.gudi.trois.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.gudi.trois.service.UserServiceInterface;
import net.sf.json.JSONObject;

@Controller
public class PKYController {
	
	@Autowired
	UserServiceInterface usi;
	
	@RequestMapping(value="/main") //메인페이지
	   public ModelAndView main(ModelAndView mav){
	      mav.setViewName("main");
	      return mav;
	   }
	
	@RequestMapping(value="/Userjoin", method = RequestMethod.POST)
	public  ModelAndView Userjoin(ModelAndView mav, HttpServletRequest req){
		
		String id = req.getParameter("id");
		String pwd = req.getParameter("pwd");
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		
		HashMap<String, Object> createUser = new HashMap<String, Object>();
		
		createUser.put("id", id);
		createUser.put("pwd", pwd);
		createUser.put("name", name);
		createUser.put("email", email);
		
		createUser = usi.join(createUser);
		
		
		mav.addObject("createuser", createUser);
		
		mav.setViewName("Userjoin");
		return mav;
	}
	
	@RequestMapping(value="/Userlogin", method=RequestMethod.POST)
	public ModelAndView Userlogin(ModelAndView mav, HttpServletRequest req, HttpSession session){
		
		String id = req.getParameter("id");
		String pwd = req.getParameter("pwd");
		
		
		
		HashMap<String, Object> userlogin = new HashMap<String, Object>();
		
		userlogin.put("id", id);
		userlogin.put("pwd", pwd);
		System.out.println(userlogin);
		HashMap<String, Object> Logindata = (HashMap<String, Object>) usi.login(userlogin);
		
		session.setAttribute("id", Logindata.get("id")); //다른 페이지에서 로그인 데이터를 가져오기 위해  세팅한것 건들면 팀장님한테 뒤짐
		
		mav.addObject("loginuser", userlogin);
		return mav;
	}
	
}
