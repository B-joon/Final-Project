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
		sb+= " �ȳ��ϼ���! <strong>PTSD</strong> �Դϴ�. <br>";
		sb+= "������ȣ�� ������ �����ϴ�.";
		sb+= "</p>";
		sb+= "<p>";
		sb+= "������ȣ : <strong>"+authCodes +"<strong>";
		sb+= "</p>";
		sb+= "<p> �����մϴ�.</p>";
		sb+= "</div>";
		sb+= "</body>";
		sb+= "</html>";
		
		return sb;
	}
}
