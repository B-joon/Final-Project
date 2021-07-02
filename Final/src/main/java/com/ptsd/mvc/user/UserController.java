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
	
	
	@RequestMapping(value="/ajaxlogin.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String , Boolean> ajaxLogin(HttpSession session, @RequestBody UserDto dto){ //@RequestBodyï¿½ï¿½ jsonï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ ï¿½ï¿½Ã¼ï¿½ï¿½ java Objectï¿½ï¿½ ï¿½Ù²ï¿½ï¿½Ø´ï¿½
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
			out.println("<script>alert('ï¿½ï¿½ï¿½ ï¿½×¸ï¿½ï¿½ï¿½ ï¿½Û¼ï¿½ï¿½Ï½ï¿½ ï¿½ï¿½ Å¬ï¿½ï¿½ï¿½ï¿½ï¿½Ö¼ï¿½ï¿½ï¿½'); </script>");
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
		
		for(int i=0; i<6; i++) {
			authCode = (int)(Math.random()*9+1);
			authCodes += Integer.toString(authCode);
		}
		System.out.println(authCodes);
		subject = "ï¿½È³ï¿½ï¿½Ï¼ï¿½ï¿½ï¿½ PTSDï¿½Ô´Ï´ï¿½. ï¿½Ì¸ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½È£ï¿½Ô´Ï´ï¿½.";
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
	
	 //·Î±×ÀÎ Ã¹ È­¸é ¿äÃ» ¸Þ¼Òµå
    @RequestMapping(value = "/loginform.do", method = { RequestMethod.GET, RequestMethod.POST })
    public String login(Model model, HttpSession session) {
		
        /* ³×ÀÌ¹ö¾ÆÀÌµð·Î ÀÎÁõ URLÀ» »ý¼ºÇÏ±â À§ÇÏ¿© naverLoginBOÅ¬·¡½ºÀÇ getAuthorizationUrl¸Þ¼Òµå È£Ãâ */
        String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
        
        //https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
        //redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
        System.out.println("³×ÀÌ¹ö:" + naverAuthUrl);
        
        //³×ÀÌ¹ö 
        model.addAttribute("url", naverAuthUrl);
 
        /* »ý¼ºÇÑ ÀÎÁõ URLÀ» View·Î Àü´Þ */
        return "userlogin";
    }
 
    //³×ÀÌ¹ö ·Î±×ÀÎ ¼º°ø½Ã callbackÈ£Ãâ ¸Þ¼Òµå
    @RequestMapping(value = "/callback.do", method = { RequestMethod.GET, RequestMethod.POST })
    public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
            throws IOException, ParseException{
        System.out.println("¿©±â´Â callback");
        OAuth2AccessToken oauthToken;
        oauthToken = naverLoginBO.getAccessToken(session, code, state);
        //·Î±×ÀÎ »ç¿ëÀÚ Á¤º¸¸¦ ÀÐ¾î¿Â´Ù.
        apiResult = naverLoginBO.getUserProfile(oauthToken);
        model.addAttribute("result", apiResult);
        
        JSONParser parser = new JSONParser();
        Object obj = parser.parse(apiResult);
        JSONObject jsonObj = (JSONObject) obj;
        //3. µ¥ÀÌÅÍ ÆÄ½Ì
        //Top·¹º§ ´Ü°è _response ÆÄ½Ì
        JSONObject response_obj = (JSONObject)jsonObj.get("response");
        //responseÀÇ °ª ÆÄ½Ì
        String userid = (String)response_obj.get("id");
        String email = (String)response_obj.get("email");
        String name = (String)response_obj.get("name");

        UserDto login = new UserDto(0, userid, null, email, null, null, "user", name, null, null, null);
        
        session.setAttribute("login", login);
        /* ³×ÀÌ¹ö ·Î±×ÀÎ ¼º°ø ÆäÀÌÁö View È£Ãâ */
        return "redirect:/";
    }
    
 
    @RequestMapping(value = "/googlelogin.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String googleLogin(@RequestBody String userid, String email, String name, HttpSession session) {
		
    	System.out.println("±¸±Û ·Î±×ÀÎ");
    	System.out.println(email);
    	
    	
    	String userid2 = email.substring(0, email.indexOf("@"));
    	
    	System.out.println("userid="+ userid);
    	System.out.println(userid2);
    	
    	System.out.println(name);
    	
    	UserDto login = new UserDto(0, userid2, null, email, null, null, "user", name, null, null, null);
    	
    	session.setAttribute("login", login);
    	
		return "redirect:/";
	}
    
    @RequestMapping(value = "/kakaologin.do", method = { RequestMethod.GET, RequestMethod.POST })
   	public String kakaoLogin(@RequestBody String email, String userid, HttpSession session) {
   		
       	System.out.println("Ä«Ä«¿À ·Î±×ÀÎ");
       	System.out.println("email=" + email);
       	System.out.println("id=" + userid);
       	
       	UserDto login = new UserDto(0, userid, null, email, null, null, "user", null, null, null, null);
       	session.setAttribute("login", login);
       	
   		return "redirect:/";
   	}
    
    
	
}
