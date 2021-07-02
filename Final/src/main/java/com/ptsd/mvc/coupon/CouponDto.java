package com.ptsd.mvc.coupon;

import java.util.Date;

public class CouponDto {

	private int makeseq;
	private int couponseq;
	private String coupontitle;
	private int userseq;
	private int discount; 
	private String usechk;
	private String endday;
	
	public CouponDto() {
		
	}
	
	public CouponDto(int makeseq, int couponseq, String coupontitle, int userseq, int discount, String usechk,
			String endday) {
		super();
		this.makeseq = makeseq;
		this.couponseq = couponseq;
		this.coupontitle = coupontitle;
		this.userseq = userseq;
		this.discount = discount;
		this.usechk = usechk;
		this.endday = endday;
	}
	
	public String getCoupontitle() {
		return coupontitle;
	}

	public void setCoupontitle(String coupontitle) {
		this.coupontitle = coupontitle;
	}

	public int getMakeseq() {
		return makeseq;
	}
	public void setMakeseq(int makeseq) {
		this.makeseq = makeseq;
	}
	public int getCouponseq() {
		return couponseq;
	}
	public void setCouponseq(int couponseq) {
		this.couponseq = couponseq;
	}
	public int getUserseq() {
		return userseq;
	}
	public void setUserseq(int userseq) {
		this.userseq = userseq;
	}
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
	public String getUsechk() {
		return usechk;
	}
	public void setUsechk(String usechk) {
		this.usechk = usechk;
	}
	public String getEndday() {
		return endday;
	}
	public void setEndday(String endday) {
		this.endday = endday;
	} 
	
	
	
	
	
}
