package com.ptsd.mvc.user;

public class DM {
	
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
		sb+= "인증번호는 다음과 같습니다.";
		sb+= "</p>";
		sb+= "<p>";
		sb+= "인증번호 : <strong>"+authCodes +"<strong>";
		sb+= "</p>";
		sb+= "<p> 감사합니다.</p>";
		sb+= "</div>";
		sb+= "</body>";
		sb+= "</html>";
		
		return sb;
	}
}
