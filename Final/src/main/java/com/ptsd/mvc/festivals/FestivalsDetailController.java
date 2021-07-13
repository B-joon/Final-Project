package com.ptsd.mvc.festivals;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FestivalsDetailController {

	private Logger logger = LoggerFactory.getLogger(FestivalsDetailController.class);
	
	@Autowired
	private FestivalsDetailBiz festivalsdetailbiz;
	
	// 상세보기
	@RequestMapping("detailfestivals.do")
	public String festivalsDetail(String title, Model model, HttpServletRequest request, HttpSession session) {
		
		logger.info(" FestivalsDetailController : festivalsDetail ");
		
		FestivalsDto festivals = festivalsdetailbiz.selectFestivalsOne(title);
		
		String fv_title = festivals.getTitle();
		
		model.addAttribute("festivals", festivals);
		request.setAttribute("festivals", festivals);
		request.setAttribute("fv_title", fv_title);
		
		
		return "festivalsdetail";
	}

}
