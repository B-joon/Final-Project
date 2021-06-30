package com.ptsd.mvc.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class UserController {
	
	@Autowired
	private UserBiz biz;
	
	@Autowired
	private EmailSender emailSender;
	
	@RequestMapping("/main.do")
	public String Main() {
		
		return "../../index";
	}
	
	@RequestMapping("/admin.do")
	public String Admin() {
		
		return "adminpage";
	}
	
	@RequestMapping("/loginform.do")
	public String loginForm() {
		return "userlogin";
	}
	
	@RequestMapping(value="/ajaxlogin.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String , Boolean> ajaxLogin(HttpSession session, @RequestBody UserDto dto){ //@RequestBody가 json으로 온 객체를 java Object로 바꿔준다
		UserDto login = biz.login(dto);
		boolean check = false;
		if (login != null) {
			session.setAttribute("login", login);
			check = true;
		}
		
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		map.put("check", check);
		System.out.println(check);
		return map;
	}
	
	@RequestMapping("userInsert.do")
	public String insertForm() {
		return "userInsert";
	}
	
	@RequestMapping(value="/userInsertres.do", method=RequestMethod.POST)
	public String insertUserRes(HttpServletResponse response, UserDto dto) throws IOException {
		
		dto.setEmail(dto.getFemail() + "@" + dto.getBemail());
		
		if (biz.insertUser(dto) > 0) {
			return "userlogin";
		}else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('모든 항목을 작성하신 후 클릭해주세요'); </script>");
			out.flush();
		}
		return "redirect:userInsert.do";
	}
	
	@RequestMapping("logout.do")
	public String logout(HttpSession session){
		
		session.invalidate();
		
		return "redirect:/";
	}
	
	@RequestMapping(value="/ajaxidChk.do", method=RequestMethod.POST)
	@ResponseBody
	public String ajaxidChk(@RequestBody String userid){
		System.out.println("userid : " + userid);
		String res = biz.idCheck(userid);
		String check = "false";
		if (res != null) {
			check = "true";
		} 
		return check;
	}
	
	@RequestMapping(value="/popup.do")
	public String popup() {
		
		return "jusoPopup";
	}
	
	@RequestMapping(value="/ajaxemailChk.do", method=RequestMethod.POST)
	@ResponseBody
	public String ajaxemailChk(@RequestBody String email){
		System.out.println("email : " + email);
		String res = biz.emailCheck(email);
		String check = "false";
		if (res != null) {
			check = "true";
		} 
		return check;
	}
	
	@RequestMapping(value="/ajaxphoneChk.do", method=RequestMethod.POST)
	@ResponseBody
	public String ajaxphoneChk(@RequestBody String phone){
		System.out.println("phone : " + phone);
		String res = biz.phoneCheck(phone);
		String check = "false";
		if (res != null) {
			check = "true";
		} 
		return check;
	}
	
	@RequestMapping(value="/proofChk.do", method=RequestMethod.POST)
	@ResponseBody
	public String proofChk(@RequestBody String email){
		String subject ="";
		String content = "";
		String receiver = "";
		String sender = "";
		
		int authCode = 0;
		String authCodes = "";
		boolean bool = false;
		
		for(int i=0; i<6; i++) {
			authCode = (int)(Math.random()*9+1);
			authCodes += Integer.toString(authCode);
		}
		System.out.println(authCodes);
		subject = "안녕하세요 PTSD입니다. 이메일 인증번호입니다.";
		content = DM.dmCertification(authCodes);
		receiver = email;
		sender = "admin@gmail.com";
		
		try {
			emailSender.sendMail(subject, content, receiver, sender);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return authCodes;
	}
	
}
