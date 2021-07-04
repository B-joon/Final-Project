package com.ptsd.mvc.reservation;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ptsd.mvc.product.ProductBiz;
import com.ptsd.mvc.review.ReviewBiz;
import com.ptsd.mvc.review.ReviewDto;

@Controller
public class ReservationController {

	@Autowired
	private ProductBiz Pbiz;
	@Autowired
	private ReviewBiz reviewbiz;
	
	@RequestMapping("/reservation.do")
	public String selectList(Model model, int productseq) {
		
		model.addAttribute("dto", Pbiz.selectOne(productseq));
		
		List<ReviewDto> list = reviewbiz.selectList(productseq);
		
		model.addAttribute("reviewlist", list);
		
		return "reservation";
	}
	
}
