package com.ptsd.mvc.reservation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ptsd.mvc.product.ProductBiz;

@Controller
public class ReservationController {

	@Autowired
	private ProductBiz Pbiz;
	
	@RequestMapping("/reservation.do")
	public String selectList(Model model, int productseq) {
		
		model.addAttribute("dto", Pbiz.selectOne(productseq));
		
		return "reservation";
	}
	
}
