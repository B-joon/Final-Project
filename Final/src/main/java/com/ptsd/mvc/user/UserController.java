package com.ptsd.mvc.user;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.scribejava.core.model.OAuth2AccessToken;

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
	@RequestMapping("/mypage.do")
	public String User() {
		return "mypage";
	}
	@RequestMapping("pay.do")
	public String pay() {
		return "payment";
	}
	
	
	@RequestMapping(value="/ajaxlogin.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String , Boolean> ajaxLogin(HttpSession session, @RequestBody UserDto dto){ //@RequestBody�� json���� �� ��ü�� java Object�� �ٲ��ش�
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
			return "redirect:userInsert.do";
		}
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
	
	 /* NaverLoginBO */
    private NaverLoginBO naverLoginBO;
    private String apiResult = null;
    
    @Autowired
    private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
        this.naverLoginBO = naverLoginBO;
    }
	
	
    @RequestMapping(value = "/loginform.do", method = { RequestMethod.GET, RequestMethod.POST })
    public String login(Model model, HttpSession session) {
		
       
        String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
        
        //https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
        //redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
        
        
        model.addAttribute("url", naverAuthUrl);
 
    
        return "userlogin";
    }
 
   
    @RequestMapping(value = "/callback.do", method = { RequestMethod.GET, RequestMethod.POST })
    public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
            throws IOException, ParseException{
        
        OAuth2AccessToken oauthToken;
        oauthToken = naverLoginBO.getAccessToken(session, code, state);
        
        apiResult = naverLoginBO.getUserProfile(oauthToken);
        model.addAttribute("result", apiResult);
        
        JSONParser parser = new JSONParser();
        Object obj = parser.parse(apiResult);
        JSONObject jsonObj = (JSONObject) obj;
        
        JSONObject response_obj = (JSONObject)jsonObj.get("response");
      
        String userid = (String)response_obj.get("id");
        String email = (String)response_obj.get("email");
        String name = (String)response_obj.get("name");
        String userids = userid + "@n";
        UserDto res = new UserDto(0, userids, null, email, null, null, "user", name, null, null, null);
        UserDto login = biz.snsCheck(res);
        
        if(login != null) {
        	session.setAttribute("login", login);
        	return "redirect:/";
        } else {
        	model.addAttribute("res", res);
        	return "usersnsinsert";
        }
        
    }
    
 
    @RequestMapping(value = "/googlelogin.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String googleLogin(Model model, @RequestBody String userid, String email, String name, HttpSession session) {
		
    	System.out.println(email);
    	
    	
    	String userid2 = email.substring(0, email.indexOf("@"));
    	String userids = userid2+ "@g";
    	System.out.println("userid="+ userid);
    	System.out.println(userid2);
    	
    	System.out.println(name);
    	
    	UserDto res = new UserDto(0, userids, null, email, null, null, "user", name, null, null, null);
    	
    	UserDto login = biz.snsCheck(res);
        
        if(login != null) {
        	session.setAttribute("login", login);
        	return "redirect:/";
        } else {
        	model.addAttribute("res", res);
        	return "usersnsinsert";
        }
    	
	}
    
    @RequestMapping(value = "/kakaologin.do", method = { RequestMethod.GET, RequestMethod.POST })
   	public String kakaoLogin(Model model, @RequestBody String email, String userid, HttpSession session) {
   		
       	System.out.println("email=" + email);
       	System.out.println("id=" + userid);
       	String userids = userid + "@k";
       	
       	UserDto res = new UserDto(0, userids, null, email, null, null, "user", null, null, null, null);
       	UserDto login = biz.snsCheck(res);
        
        if(login != null) {
        	session.setAttribute("login", login);
        	return "redirect:/";
        } else {
        	model.addAttribute("res", res);
        	return "usersnsinsert";
        }
       	
   	}
    
    @RequestMapping(value="/usersnsInsertres.do", method=RequestMethod.POST)
	public String snsinsertUserRes(HttpServletResponse response, UserDto dto, HttpSession session) throws IOException {
		System.out.println("snsinsert:"+dto);
		if (biz.insertUser(dto) > 0) {
			UserDto login = biz.snsCheck(dto);
			session.setAttribute("login", login);
			return "redirect:main.do";
		}else {
			return "redirect:userInsert.do";
		}
	}
    
    
	
}
