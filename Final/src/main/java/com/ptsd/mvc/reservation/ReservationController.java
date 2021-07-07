package com.ptsd.mvc.reservation;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
	private LikeBiz likebiz;
	
	@RequestMapping("/reservation.do")
	public String selectList(Model model, int productseq, int reviewseq, HttpServletRequest HttpRequest) {
		
		model.addAttribute("dto", Pbiz.selectOne(productseq));
		
		// 후기
		List<ReviewDto> list = reviewbiz.selectList(productseq);
		model.addAttribute("reviewlist", list);
		
		// 좋아요
		int userseq = ((UserDto) HttpRequest.getSession().getAttribute("login")).getUserseq();
		
		LikeDto likeDto = new LikeDto();
		likeDto.setReviewseq(reviewseq);
		likeDto.setUserseq(userseq);
		
		int likeseq = likebiz.likeCount(likeDto);
		
		model.addAttribute("likeseq", likeseq);
		
		return "reservation";
	}
	
}
