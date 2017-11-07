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



import kr.gudi.trois.service.UserServiceInterface;
import kr.gudi.util.HttpUtil;
import net.sf.json.JSONObject;

@Controller
public class PKYController {
   
   @Autowired
   UserServiceInterface usi;
   
	@RequestMapping(value = "/main") // 메인페이지
	public ModelAndView main(ModelAndView mav) {
		mav.setViewName("main");
		return mav;
	}
   
   @RequestMapping(value="/LoginCheck", method = RequestMethod.POST)
   public void LoginCheck(HttpServletResponse resp, HttpSession session){
	   HashMap<String, Object> user = (HashMap<String, Object>) session.getAttribute("user");
	   HashMap<String, Object> map = new HashMap<String, Object>();
	   if(user == null){
		   map.put("status", 0);
	   }else{
		   map.put("status", 1);
	   }
	   HttpUtil.sendResponceToJson(resp, map);
   }
   
   
   @RequestMapping(value="/Userjoin", method = RequestMethod.POST)
   public void Userjoin(HttpServletResponse resp, HttpServletRequest req, HttpSession session){
      
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
      

      HttpUtil.sendResponceToJson(resp, createUser);
   }
   
   @RequestMapping(value="/Userlogin", method = RequestMethod.POST)
   public void Userlogin(HttpServletRequest req, HttpServletResponse resp, HttpSession session){
      
      String id = req.getParameter("id");
      String pwd = req.getParameter("pwd");
//      String del_yn = req.getParameter("del_yn");
//      System.out.println(id); System.out.println(pwd);
//      System.out.println(del_yn);
      
      
      HashMap<String, Object> userlogin = new HashMap<String, Object>();
      
      userlogin.put("id", id);
      userlogin.put("pwd", pwd);
//      userlogin.put("del_yn", del_yn);
//      System.out.println(userlogin);
      HashMap<String, Object> Logindata = (HashMap<String, Object>) usi.login(userlogin);
      System.out.println("Logindata" + Logindata);
      System.out.println("userlogin" + userlogin);
//      session.setAttribute("id", Logindata.get("id")); //다른 페이지에서 로그인 데이터를 가져오기 위해  세팅한것 건들면 팀장님한테 뒤짐
//      
//      mav.addObject("loginuser", userlogin);
//      System.out.println(Logindata);
      session.setAttribute("user", Logindata);
      
      HttpUtil.sendResponceToJson(resp, Logindata);
   }
   @RequestMapping(value="/checkid", method = RequestMethod.POST)
   public void checkid(HttpServletRequest req, HttpServletResponse resp){
      HashMap<String, Object> checkid = HttpUtil.getParameterMap(req);
      System.out.println(checkid);
      HashMap<String, Object> checkiddata = (HashMap<String, Object>) usi.checkid(checkid);
      
      HttpUtil.sendResponceToJson(resp, checkiddata);
   }
   @RequestMapping(value="/findid", method = RequestMethod.POST)
   public void findid(HttpServletRequest req, HttpServletResponse resp){
      
      
      HashMap<String, Object> findid = HttpUtil.getParameterMap(req);
      System.out.println("findid" + findid);
      
      HashMap<String, Object> findiddata = (HashMap<String, Object>) usi.findid(findid);
      System.out.println("finddate" + findiddata);
      
      HttpUtil.sendResponceToJson(resp, findiddata);
   }
   @RequestMapping("/logout")
	public ModelAndView logout(ModelAndView mav, HttpSession session) {
		session.invalidate();
		mav.setViewName("redirect:/main");
		return mav;
	}
   
   @RequestMapping(value="/updatepw", method = RequestMethod.POST)
   public void updatepw(HttpServletRequest req, HttpServletResponse resp){
      HashMap<String, Object> updatepw = HttpUtil.getParameterMap(req);
//      System.out.println(updatepw);
      
      
      HttpUtil.sendResponceToJson(resp, usi.updatepw(updatepw));
   }
   
}