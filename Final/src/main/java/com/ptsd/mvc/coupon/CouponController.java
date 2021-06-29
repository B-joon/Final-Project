package com.ptsd.mvc.coupon;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CouponController {

	@Autowired
	private CouponBiz biz;
	
	
	//관리자가 쿠폰을 만들었을 때 
	//관리자페이지에서 쿠폰생성페이지 이동
	@RequestMapping("/coupon.do")
	public String createCoupon() {
		return "admincoupon";
	}
	
	//쿠폰 등록 (화면에 쿠폰 뿌려주기) 
	@RequestMapping("createcoupon.do")
	public String createCoupon(int discount, Model model,CouponDto dto) {
		model.addAttribute("discount", discount);
		if(biz.insert(dto)>0) {
			return "eventlist";
		}
		System.out.println(discount);
		return "couponinsert";
	}
	
	
	
	
	
	
	@RequestMapping("createcouponres.do")
	public String createCouponRes() {
		return "";
	}
	
	
	
	
	
	
	
	
	
	public String selectList(Model model) {
		model.addAttribute("list", biz.selectList());
		return "";
	}
	
	
	
	
	public String insertForm() {
		return "";
	}
	
	public String insertRes(CouponDto dto) {
		if(biz.insert(dto)>0) {
			return "";
		}
		return "";
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
