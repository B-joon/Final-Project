package com.ptsd.mvc.mail;

import java.util.StringTokenizer;

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
		String from = "kas7894.dev@naver.com";
		String to = request.getParameter("tomail");
		// String filename = request.getParameter("submitFile");
		
		StringTokenizer st = new StringTokenizer(to,",");
		String[] toMail = new String[st.countTokens()];
		int index = 0;
		while (st.hasMoreTokens()) {
			toMail[index] = st.nextToken();
			index++;
		}
		try {
			MimeMessage mail = mailSender.createMimeMessage();
			MimeMessageHelper mailHelper = new MimeMessageHelper(mail, true, "UTF-8");
			// true�� ��Ƽ��Ʈ �޼����� ����ϰڴٴ� �ǹ�. true�� ���� �ܼ� �ؽ�Ʈ �޼���
			
			mailHelper.setFrom(from);	// ������ ��� �����ϸ� ���� �۵� �ȵ�
			mailHelper.setTo(toMail);
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
