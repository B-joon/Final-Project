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
		
		if (biz.reviewInsert(dto) > 0) {
			return "redirect: reservation.do";
		}
		
		return "redirect: reservation.do";
	}
	
	@RequestMapping("reviewupdate.do")
	public String reviewUpdate(ReviewDto dto) {
		
		if (biz.reviewUpdate(dto) > 0) {
			return "redirect: reservation.do";
		}
		
		return "redirect: reservation.do";
	}
	
	@RequestMapping("reviewdel.do")
	public String reviewDel(int reviewseq) {
		
		if (biz.reviewDel(reviewseq) > 0) {
			return "redirect: reservation.do";
		}
		
		return "redirect: reservation.do";
	}
	
}
