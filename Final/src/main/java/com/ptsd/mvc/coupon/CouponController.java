package com.ptsd.mvc.coupon;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

@Controller
public class CouponController {

	@Autowired
	private CouponBiz biz;
	
	//�����ڰ� ����� ���� ����Ʈ�� �����ش� 
	public String selectList(Model model) {
		model.addAttribute("list", biz.selectList());
		return "";
	}
	
	//�����ڷ� �α������� ���, ���������ϴ� �ڵ� (������ȣ�� �Ȼ����)  
	// �����ڰ� ���� �����ÿ��� html �ڵ�� ��ư�� �����ǰ� �����Ѵ�. 
	
	
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
