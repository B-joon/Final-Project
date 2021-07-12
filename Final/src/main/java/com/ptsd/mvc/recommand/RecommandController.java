package com.ptsd.mvc.recommand;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ptsd.mvc.user.UserDto;

@Controller
public class RecommandController {
	
	@Autowired
	private RecommandBiz biz;
	
	@ResponseBody
	@RequestMapping(value = "/recommand.do", method = RequestMethod.POST)
	public int recommandCnt(Model model, HttpServletRequest request) {
		
		int recommandseq = Integer.parseInt(request.getParameter("recommand"));
		int productseq = Integer.parseInt(request.getParameter("productseq"));
		int userseq = ((UserDto) request.getSession().getAttribute("login")).getUserseq();
		
		RecommandDto dto = new RecommandDto();
		
		dto.setProductseq(productseq);
		dto.setUserseq(userseq);
		
		if (recommandseq >= 1) {
			biz.recommandDelete(dto);
			recommandseq = 0;
		} else {
			biz.recommandInsert(dto);
			recommandseq = 1;
		}
		
		return recommandseq;
	
	}
}
