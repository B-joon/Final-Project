package com.ptsd.mvc.reservation;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ptsd.mvc.coupon.CouponBiz;
import com.ptsd.mvc.coupon.CouponDto;
import com.ptsd.mvc.like.LikeBiz;
import com.ptsd.mvc.like.LikeDto;
import com.ptsd.mvc.product.ProductBiz;
import com.ptsd.mvc.review.ReviewBiz;
import com.ptsd.mvc.review.ReviewDto;
import com.ptsd.mvc.user.UserDto;

@Controller
public class ReservationController {

	@Autowired
	private ProductBiz Pbiz;
	@Autowired
	private ReviewBiz reviewbiz;
	@Autowired
	private CouponBiz mycouponbiz;
	
	@RequestMapping("/reservation.do")
	public String selectList(Model model, int productseq, HttpServletRequest HttpRequest) {
		
		model.addAttribute("dto", Pbiz.selectOne(productseq));
		
		// 후기
		List<ReviewDto> list = reviewbiz.selectList(productseq);
		model.addAttribute("reviewlist", list);
		
		List<CouponDto> couponlist = mycouponbiz.selectList();
		
		model.addAttribute("couponlist", couponlist);
		
		return "reservation";
	}
	
}
