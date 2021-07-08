package com.ptsd.mvc.review;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ReviewController {

	@Autowired
	private ReviewBiz biz;
	
	@RequestMapping("reviewinsert.do")
	public String reviewInsert(ReviewDto dto) {
		System.out.println(dto.getProductseq());
		if (biz.reviewInsert(dto) > 0) {
			return "redirect: reservation.do?productseq=" + dto.getProductseq();
		}
		
		return "redirect: reservation.do?productseq=" + dto.getProductseq();
	}
	
	@RequestMapping("reviewupdate.do")
	public String reviewUpdate(ReviewDto dto) {
		
		if (biz.reviewUpdate(dto) > 0) {
			return "redirect: reservation.do?productseq=" + dto.getProductseq();
		}
		
		return "redirect: reservation.do?productseq=" + dto.getProductseq();
	}
	
	@RequestMapping("reviewdel.do")
	public String reviewDel(int reviewseq, int productseq) {
		
		if (biz.reviewDel(reviewseq) > 0) {
			return "redirect: reservation.do?productseq=" + productseq;
		}
		
		return "redirect: reservation.do?productseq=" + productseq;
	}
	
}
