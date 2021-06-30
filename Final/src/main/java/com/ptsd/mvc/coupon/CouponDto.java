package com.ptsd.mvc.coupon;

import java.util.Date;

public class CouponDto {

	private int couponseq;
	private String couponno; 
	private int userseq; 
	private int discount;
	private String usechk;
	private Date cpstart; 
	private Date cpend;
	
	public CouponDto() {
	}
	
	public CouponDto(int couponseq, String couponno, int userseq, int discount, String usechk, Date cpstart,
			Date cpend) {
		this.couponseq = couponseq;
		this.couponno = couponno;
		this.userseq = userseq;
		this.discount = discount;
		this.usechk = usechk;
		this.cpstart = cpstart;
		this.cpend = cpend;
	}


	public int getCouponseq() {
		return couponseq;
	}

	public void setCouponseq(int couponseq) {
		this.couponseq = couponseq;
	}

	public String getCouponno() {
		return couponno;
	}
	public void setCouponno(String couponno) {
		this.couponno = couponno;
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
	public Date getCpstart() {
		return cpstart;
	}
	public void setCpstart(Date cpstart) {
		this.cpstart = cpstart;
	}
	public Date getCpend() {
		return cpend;
	}
	public void setCpend(Date cpend) {
		this.cpend = cpend;
	} 
	
	
}
