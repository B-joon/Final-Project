package com.ptsd.mvc.user;

public class PwDM {
	
	public static String dmCertification(String authCodes) {
		String sb = "";
		
		sb = "<!DOCTYPE html>";
		sb+= "<html>";
		sb+= "<head>";
		sb+= "<meta charset='UTF-8'>";
		sb+= "<title>Insert title here</title>";
		sb+= "</head>";
		sb+= "<body>";
		sb+= "<div>";
		sb+= "<p>";
		sb+= " 안녕하세요! <strong>PTSD</strong> 입니다. <br>";
		sb+= "새로운 비밀번호는 다음과 같습니다.";
		sb+= "</p>";
		sb+= "<p>";
		sb+= "비밀번호 : <strong>"+authCodes +"<strong>";
		sb+= "</p>";
		sb+= "<p> 반드시 마이페이지에서 비밀번호를 다시 변경해 주시길 바랍니다.</p>";
		sb+= "<p> 감사합니다.</p>";
		sb+= "</div>";
		sb+= "</body>";
		sb+= "</html>";
		
		return sb;
	}
	
}
