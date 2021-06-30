package com.ptsd.mvc.coupon;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

@Controller
public class CouponController {

	@Autowired
	private CouponBiz biz;
	
	//관리자가 등록한 쿠폰 리스트를 보여준다 
	public String selectList(Model model) {
		model.addAttribute("list", biz.selectList());
		return "";
	}
	
	//관리자로 로그인했을 경우, 쿠폰생성하는 코드 (쿠폰번호는 안생긴다)  
	// 관리자가 쿠폰 생성시에는 html 코드로 버튼만 생성되게 구현한다. 
	
	
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
