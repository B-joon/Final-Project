package com.ptsd.mvc.wish;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class WIshController {

	@Autowired
	WishBiz wishbiz;

	@RequestMapping("/wishList.do")
	public ModelAndView wishList(ModelAndView mav) {

		Map<String, Object> map = new HashMap<>();

		List<WishDto> list = wishbiz.wishList();

		map.put("list", list);
		map.put("count", list.size());

		mav.setViewName("wishlist");
		mav.addObject("map", map);

		return mav;
	}

	@RequestMapping("/wishInsert.do")
	public String wishInsert(WishDto dto) {

		if (wishbiz.wishInsert(dto) > 0) {
			return "redirect:wishList.do";
		}

		return "redirect:wishInsert.do";
	}

	@RequestMapping("/wishDelete.do")
	public String wishDelete(@RequestParam int wishseq) {

		wishbiz.wishDelete(wishseq);

		return "redirect:wishList.do";
	}

}
