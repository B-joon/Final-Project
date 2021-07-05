package com.ptsd.mvc.wish;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

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

	@RequestMapping("/wishList.do")
	public ModelAndView wishList(ModelAndView mav, HttpSession session) {

		Map<String, Object> map = new HashMap<>();
		
		UserDto login = <UserDto> session.getAttribute("login");
		
		dto.setLogin(login);
		
		if(login != null) {
			
		List<WishDto> list = wishbiz.wishList();

		map.put("list", list);
		map.put("count", list.size());

		mav.setViewName("wishlist");
		mav.addObject("map", map);

		return mav;
		
		}
		
		
	}

	@RequestMapping("/wishInsert.do")
	public String wishInsert(@ModelAttribute UserDto dto, HttpSession session) {

		UserDto login = (UserDto) session.getAttribute("login");
		dto.setUserseq();
		if (login == null) {
			return "redirtect:login.do";
		}
		
		dto.setUserseq(login);
		wishbiz.wishInsert(dto);
		return "redirect:wishList.do";
		
	}

	@RequestMapping("/wishDelete.do")
	public String wishDelete(@RequestParam int wishseq) {

		wishbiz.wishDelete(wishseq);

		return "redirect:wishList.do";
	}

}
