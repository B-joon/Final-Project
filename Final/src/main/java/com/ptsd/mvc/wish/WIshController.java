package com.ptsd.mvc.wish;

import java.util.HashMap; 
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ptsd.mvc.user.UserDto;

@Controller
public class WIshController {

	@Autowired
	WishBiz wishbiz;

	@RequestMapping(value = "/wishInsert.do", method = RequestMethod.POST)
	@ResponseBody
	public int wishInsert(int productseq, int userseq) {
		
		WishDto dto = new WishDto();
		dto.setProductseq(productseq);
		dto.setUserseq(userseq);

		int res = wishbiz.wishInsert(dto);

		if (res > 0) {
			return res;
		} else {
			return 0;
		}
		
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

	@RequestMapping(value = "/wishDelete.do", method = RequestMethod.POST)
	@ResponseBody
	public String wishDelete(int productseq, int userseq) {

		WishDto dto = new WishDto();
		dto.setProductseq(productseq);
		dto.setUserseq(userseq);
		
		wishbiz.wishDelete(dto);

		return "redirect:wishList.do";
	}
	
	@RequestMapping("chkWish.do")
	@ResponseBody
	public int chkWish(int productseq, int userseq) {
		
		WishDto dto = new WishDto();
		dto.setProductseq(productseq);
		dto.setUserseq(userseq);
		
		int res = wishbiz.chkWish(dto);
		
		System.out.println(res);
		
		return res;
	}
	
	@RequestMapping("getWishCount.do")
	@ResponseBody
	public int getWishCount(int productseq, int userseq) {
		
		WishDto dto = new WishDto();
		dto.setProductseq(productseq);
		dto.setUserseq(userseq);
		
		int res = wishbiz.wishCount(dto);
		
		System.out.println(res);
		
		return res;
	}
}
