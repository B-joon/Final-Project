package com.ptsd.mvc.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ptsd.mvc.coupon.CouponBiz;
import com.ptsd.mvc.coupon.CouponDto;
import com.ptsd.mvc.coupon.MakeCouponBiz;
import com.ptsd.mvc.coupon.MakeCouponDto;

@Controller
public class EventController {
	@Autowired
	private NoticeBiz biz;
	@Autowired
	private MakeCouponBiz couponbiz;
	@Autowired // 쿠폰 다운로드 biz
	private CouponBiz downcouponbiz;
	
	
	@RequestMapping("/eventlist.do")
	public String selectList(Model model, PagingCriteria cri) {
		
		List<NoticeDto> list = biz.selectList(cri);
		List<MakeCouponDto> Couponlist = couponbiz.selectList();
		List<CouponDto> downcouponlist = downcouponbiz.selectList();
		
		int total = biz.totalCnt();
		
		model.addAttribute("list", list);
		model.addAttribute("couponlist", Couponlist);
		model.addAttribute("downcouponlist", downcouponlist);
		model.addAttribute("paging", new PageMaker(cri, total));
		
		
		return "eventlist";
	}
	
	@RequestMapping("/eventone.do")
	public String selectOne(Model model, int boardseq, @ModelAttribute("cri") PagingCriteria cri) {
		
		model.addAttribute("dto", biz.selectOne(boardseq));
		
		return "eventone";
	}
	
	@RequestMapping("/eventinsertform.do")
	public String insertForm() {
		return "eventinsert";
	}
	@RequestMapping("/eventinsertres.do")
	public String insertRes(NoticeDto dto) {
		
		if (biz.insert(dto) > 0) {
			return "redirect:eventlist.do";
		}
		
		return "redirect:eventinsertform.do";
	}
	
	@RequestMapping("/eventupdateform.do")
	public String updateForm(Model model, int boardseq) {
		
		model.addAttribute("dto", biz.selectOne(boardseq));
		
		return "eventupdate";
	}
	
	@RequestMapping("/eventupdateres.do")
	public String updateRes(NoticeDto dto) {
		
		if (biz.update(dto) > 0) {
			return "redirect:eventone.do?boardseq=" + dto.getBoardseq();
		}
		
		return "redirect:eventupdateform.do";
	}
	
	@RequestMapping("/eventdelete.do")
	public String delete(Model model, int boardseq) {
		
		if (biz.delete(boardseq) > 0) {
			return "redirect:eventlist.do";
		}
		
		return "redirect:eventone.do";
	}

}
