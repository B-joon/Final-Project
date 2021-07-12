package com.ptsd.mvc.reservation;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
	@Autowired
	private ReservationBiz reservationbiz;

	
	@RequestMapping("/reservation.do")
	public String selectList(Model model, int productseq, HttpServletRequest HttpRequest) {
		
		model.addAttribute("dto", Pbiz.selectOne(productseq));
		
		// 후기
		List<ReviewDto> list = reviewbiz.selectList(productseq);
		model.addAttribute("reviewlist", list);
		//쿠폰목록
		List<CouponDto> couponlist = mycouponbiz.selectList();
		
		model.addAttribute("couponlist", couponlist);
		
		return "reservation";
	}
	
	//결제 시 결제 데이터 insert
	@ResponseBody
	@RequestMapping(value = "insertreservation.do", method = RequestMethod.POST)
	public String insert(HttpServletRequest request) {
		
		String productname = request.getParameter("productname");
		int userseq = Integer.parseInt(request.getParameter("userseq"));
		int price = Integer.parseInt(request.getParameter("price"));
		String people = request.getParameter("people");
		String playdate = request.getParameter("playdate");
		
		ReservationDto dto = new ReservationDto();
		
		dto.setPeople(people);
		dto.setPlaydate(playdate);
		dto.setPrice(price);
		dto.setProductname(productname);
		dto.setUserseq(userseq);
		
		
		System.out.println(dto.getPlaydate());
		
		if(reservationbiz.insert(dto)>0) {
			return "redirect:mypage.do?userseq="+userseq;
			
		}
		return "redirect:main.do";
		
	}
	
	@RequestMapping("refund.do")
	public String delete(int reservationseq, int userseq) {
		if (reservationbiz.delete(reservationseq) > 0) {
			return "redirect:mypage.do?userseq="+userseq;
		}
		return "redirect:mypage.do?userseq="+userseq;
	}
	
	
	
}
