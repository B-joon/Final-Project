package com.ptsd.mvc.mail;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MailController {
	
	@Autowired
	private JavaMailSender mailSender;
	
	
	@RequestMapping("/mailform.do")
	public String insertForm() {
		return "mail";
	}
	
	@RequestMapping("/mailSending.do")
	public String mailSending(HttpServletRequest request)  {
		
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		String from = "hanjiyeon.dev@gmail.com";
		String to = request.getParameter("tomail");
		// String filename = request.getParameter("submitFile");
		
		try {
			MimeMessage mail = mailSender.createMimeMessage();
			MimeMessageHelper mailHelper = new MimeMessageHelper(mail, true, "UTF-8");
			// true는 멀티파트 메세지를 사용하겠다는 의미. true안 쓰면 단순 텍스트 메세지
			
			mailHelper.setFrom(from);	// 보내는 사람 생략하면 정상 작동 안됨
			mailHelper.setTo(to);
			mailHelper.setSubject(subject);
			mailHelper.setText(content, true);
			// true는 html을 사용. true 안쓰면 단순 텍스트만 사용
			
			// 파일 업로드 코드로 가져와야 할 듯
			// FileSystemResource file = new FileSystemResource();
			// mailHelper.addAttachment(filename, file);
			
			mailSender.send(mail);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		return "mailEnd"; 
		
	}

}
