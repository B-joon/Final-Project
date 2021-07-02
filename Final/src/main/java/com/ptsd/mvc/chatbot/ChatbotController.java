package com.ptsd.mvc.chatbot;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ChatbotController {
	
	@RequestMapping("/chatbot.do")
	public String chatbot() {
		return "chatbot";
	}

}
