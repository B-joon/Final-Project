package com.ptsd.mvc.coupon;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ptsd.mvc.notice.NoticeDto;

@Controller
public class CouponController {

	@Autowired // 쿠폰 다운로드 biz
	private CouponBiz biz;

	@Autowired // 쿠폰 생성 biz
	private MakeCouponBiz couponbiz;

	//Admin
	//관리자 페이지에서 쿠폰 페이지로 이동 -> 리스트 보여주기
	@RequestMapping("/coupon.do")
	public String createCoupon(Model model) {
		
		List<MakeCouponDto> list = couponbiz.selectList();
		
		model.addAttribute("list", list);
		return "couponlist";
	}
	
	// 관리자가 쿠폰을 만들었을 때
		// 관리자페이지에서 쿠폰생성페이지 이동
	@RequestMapping("makecoupon.do")
	public String makeCoupon() {
		return "createcoupon";
	}
	
	@RequestMapping("couponselect.do")
	public String selectOne(Model model, int makeseq) {
		model.addAttribute("dto", couponbiz.selectOne(makeseq));
		return "coupondetail";
	}
	
	@RequestMapping("/couponupdateform.do")
	public String updateForm(Model model, int makeseq) {
		
		model.addAttribute("dto", couponbiz.selectOne(makeseq));
		
		return "couponupdate";
	}
	
	@RequestMapping("/couponupdateres.do")
	public String updateRes(MakeCouponDto dto) {
		
		if (couponbiz.update(dto) > 0) {
			return "redirect:couponselect.do?makeseq=" + dto.getMakeseq();
		}
		
		return "redirect:couponupdateform.do";
	}
	
	@RequestMapping("/coupondelete.do")
	public String delete(Model model, int makeseq) {
		
		if (couponbiz.delete(makeseq) > 0) {
			return "redirect:coupon.do";
		}
		
		return "redirect:couponselect.do";
	}

	

	// 쿠폰 등록 (화면에 쿠폰 뿌려주기)
	@RequestMapping("createcoupon.do")
	public String createCoupon(int discount, Model model, MakeCouponDto dto) {
		model.addAttribute("discount", discount);
		if (couponbiz.insert(dto) > 0) {
			return "coupon.do";
		}
		System.out.println(discount);
		return "couponinsert";
	}

	// user
	// 다운로드 쿠폰
	@RequestMapping("downloadcoupon.do")
	public String downloadcoupon(CouponDto dto) {
		
		if (biz.insert(dto) > 0) {
			return "redirect:main.do";
		}

		return "mypage";
	}

	// 내 쿠폰함 user별 보유 쿠폰 리스트
	@RequestMapping("mycoupon.do")
	public String selectList(Model model) {
		model.addAttribute("list", biz.selectList());
		return "mycoupon";
	}

	// 스케줄에 맞게 자동 삭제
	@Scheduled(cron = "0 0 02 * * ?") //매일 새벽두시에 실행 
	public void delete() {

		List<CouponDto> list = biz.selectList(); //쿠폰리스트 불러오기 

		DateFormat sdFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date nowDate = new Date(); 
		String today = sdFormat.format(nowDate);//현재날짜
		for (CouponDto couponDto : list) {
			String endday = couponDto.getEndday(); // 쿠폰의 종료날짜
			if (today.equals(endday)) { //현재 날짜와 쿠폰 종료날짜가 같다면 삭제할것 

				if (biz.DailyDelete(endday) > 0) {
					biz.DailyDelete(endday);
				}
			}

		}
	}
	
	

	

}
