package com.ptsd.mvc.wish;

import java.util.HashMap; 
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ptsd.mvc.user.UserDto;

@Controller
public class WIshController {

	@Autowired
	WishBiz wishbiz;

	@RequestMapping("/wishInsert.do")
	public String wishInsert(@ModelAttribute WishDto dto, HttpServletRequest request) {
		
		int userseq = ((UserDto) request.getSession().getAttribute("login")).getUserseq();
		dto.setUserseq(userseq);
		
		int count = wishbiz.wishCount(dto.getProductseq(), userseq);
		if(count == 0) {
			wishbiz.wishInsert(dto);
		} else {
			return "redirect:wishList.do";
		}
		return "redirect:wishList.do";
		
	}
	
	@RequestMapping("/wishList.do")
	public ModelAndView wishList(ModelAndView mav, HttpServletRequest request) {

		int userseq = ((UserDto) request.getSession().getAttribute("login")).getUserseq();
		
		Map<String, Object> map = new HashMap<>();

		List<WishDto> list = wishbiz.wishList(userseq);

		map.put("list", list);
		map.put("count", list.size());

		mav.setViewName("wishlist");
		mav.addObject("map", map);
		
		return mav;

	}

	@RequestMapping("/wishDelete.do")
	public String wishDelete(@RequestParam int wishseq) {

		wishbiz.wishDelete(wishseq);

		return "redirect:wishList.do";
	}

}
