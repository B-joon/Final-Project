package com.ptsd.mvc.like;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ptsd.mvc.user.UserDto;

@Controller
public class LikeController {

	@Autowired
	private LikeBiz biz;
	
	@ResponseBody
	@RequestMapping(value = "/like.do", method = RequestMethod.POST)
	public int likeCnt(Model model, HttpServletRequest request) {
		
		int likeseq = Integer.parseInt(request.getParameter("like"));
		int reviewseq = Integer.parseInt(request.getParameter("reviewseq"));
		int userseq = ((UserDto) request.getSession().getAttribute("login")).getUserseq();
		
		LikeDto dto = new LikeDto();
		
		dto.setReviewseq(reviewseq);
		dto.setUserseq(userseq);
		
		if (likeseq >= 1) {
			biz.likeDel(dto);
			biz.likeUpdate(reviewseq);
			likeseq = 0;
		} else {
			biz.likeInsert(dto);
			biz.likeUpdate(reviewseq);
			likeseq = 1;
		}
		
		return likeseq;
	}
	
	@RequestMapping(value = "likecnt.do", method = RequestMethod.POST)
	public int like(Model model, int reviewseq, int userseq, HttpServletRequest request) {
		// 좋아요
		
		
		LikeDto likeDto = new LikeDto();
		likeDto.setReviewseq(reviewseq);
		likeDto.setUserseq(userseq);
		
		int likeseq = biz.likeCount(likeDto);
		
		model.addAttribute("likeseq", likeseq);
		
		return likeseq;
	}
}