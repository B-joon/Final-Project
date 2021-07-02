package com.ptsd.mvc.wish;

import java.util.ArrayList;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ptsd.mvc.product.ProductDto;
import com.ptsd.mvc.user.UserDto;

@Controller
public class WIshController {

	@Autowired
	WishBiz wishbiz;
	
	@RequestMapping("/wishlist.do")
	public String wishList(Model model, int wishuserseq) {
		
		model.addAttribute("list", wishbiz.listWish(wishuserseq));
				
	return "wishList";
	
	}

}
