package com.ptsd.mvc.reservation;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ReservationController {

	@RequestMapping("/reservation.do")
	public String selectList(Model model) {
		
		return "reservation";
	}
	
}
