package com.ptsd.mvc.wishlike;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ptsd.mvc.user.UserDto;

@Controller
public class WishlikeController {

	@Autowired
	private WishlikeBiz biz;
	
	@ResponseBody
	@RequestMapping(value="/wishlike.do", method=RequestMethod.POST)
	public int wishlikeCnt(Model model, HttpServletRequest request) {
		
		int wishlikeseq = Integer.parseInt(request.getParameter("wishlike"));
		int wishseq = Integer.parseInt(request.getParameter("wishseq"));
		int userseq = ((UserDto) request.getSession().getAttribute("login")).getUserseq();
		
		WishlikeDto dto = new WishlikeDto();
		
		dto.setWishseq(wishseq);
		dto.setUserseq(userseq);
		
		if(wishlikeseq >= 1) {
			biz.wishlikeDelete(dto);
			biz.wishlikeUpdate(wishseq);
			wishlikeseq = 0;
		} else {
			biz.wishlikeInsert(dto);
			biz.wishlikeUpdate(wishseq);
			wishlikeseq = 1;
		}
		
		return wishlikeseq;
	}
	
	@ResponseBody
	@RequestMapping(value="wishlikecnt.do", method=RequestMethod.POST)
	public int wishlike(Model model, HttpServletRequest request) {
	
		int wishseq = Integer.parseInt(request.getParameter("wishseq"));
		int userseq = Integer.parseInt(request.getParameter("userseq"));
		
		WishlikeDto wishlikeDto = new WishlikeDto();
		wishlikeDto.setWishseq(wishseq);
		wishlikeDto.setUserseq(userseq);
		
		int wishlikeseq = biz.wishlikeCount(wishlikeDto);
		
		model.addAttribute("wishlikeseq", wishlikeseq);
		
		return wishlikeseq;
		
	}
}
