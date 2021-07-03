package com.ptsd.mvc.coupon;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CouponController {

	@Autowired
	private CouponBiz biz;
	
	@Autowired
	private MakeCouponBiz couponbiz;
	
	
	
	//관리자가 쿠폰을 만들었을 때 
	//관리자페이지에서 쿠폰생성페이지 이동
	@RequestMapping("/coupon.do")
	public String createCoupon() {
		return "admincoupon";
	}
	
	//쿠폰 등록 (화면에 쿠폰 뿌려주기) 
	@RequestMapping("createcoupon.do")
	public String createCoupon(int discount, Model model, MakeCouponDto dto) {
		model.addAttribute("discount", discount);
		if(couponbiz.insert(dto)>0) {
			return "redirect:eventlist.do";
		}
		System.out.println(discount);
		return "couponinsert";
	}
	
	
	//다운로드 쿠폰 
	@RequestMapping("downloadcoupon.do")
	public String downloadcoupon(CouponDto dto) {
		if(biz.insert(dto)>0) {
			return "redirect:main.do";
		}
		
		return "mypage";
	}
	
	//내 쿠폰함 보유 쿠폰 리스트
	@RequestMapping("mycoupon.do")
	public String selectList(Model model) {
		model.addAttribute("list", biz.selectList());
		return "mycoupon";
	}
	
	

	
	public String updateForm(Model model, int couponseq) {
		model.addAttribute("dto", biz.selectOne(couponseq));
		
		return "";
	}
	
	public String updateRes(CouponDto dto) {
		if (biz.update(dto)>0) {
			return "";
		}
		return "";
	}
	
	public String delete(int couponseq) {
		if(biz.delete(couponseq) >0) {
			return "";
		}
		return "";
	}
}
