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
			// true�� ��Ƽ��Ʈ �޼����� ����ϰڴٴ� �ǹ�. true�� ���� �ܼ� �ؽ�Ʈ �޼���
			
			mailHelper.setFrom(from);	// ������ ��� �����ϸ� ���� �۵� �ȵ�
			mailHelper.setTo(to);
			mailHelper.setSubject(subject);
			mailHelper.setText(content, true);
			// true�� html�� ���. true �Ⱦ��� �ܼ� �ؽ�Ʈ�� ���
			
			// ���� ���ε� �ڵ�� �����;� �� ��
			// FileSystemResource file = new FileSystemResource();
			// mailHelper.addAttachment(filename, file);
			
			mailSender.send(mail);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		return "mailEnd"; 
		
	}

}
