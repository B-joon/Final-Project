package com.ptsd.mvc.wish.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class WishController {

	@Autowired
	private WishBiz wishbiz;
	
	@RequestMapping("/insertwishform.do")
		public String insertwishForm() {
	
		return "wishinsert";
	}
	
	@RequestMapping("/insertwishres")
		public String insertwishRes(WishDto dto) {
		
		if (wishbiz.insertwish(dto) > 0) {
			return "redirect:wishlist.do";
		}
		
		return "redirect:wishinsertform.do";
	}
		
	@RequestMapping("/deletewish.do");
	public String delete(int ) {
		return "redirect:wishlist.do";
	}
	
	return "redirect:
	
	
	
	@RequestMapping("wishlist.do")
	public String wishList(Model model) {
		List<WishDto> list = biz.selectList();
		
		model
		
		return "wishlist";
	}
	


}