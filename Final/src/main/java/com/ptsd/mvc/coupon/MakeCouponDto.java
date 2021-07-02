package com.ptsd.mvc.coupon;



public class MakeCouponDto {
	
	private int makeseq;
	private String coupontitle;
	private int discount; 
	private int userseq;
	private String endday;
	
	public MakeCouponDto() {
		
	}
	public MakeCouponDto(int makeseq, String coupontitle, int discount, int userseq, String endday) {
		super();
		this.makeseq = makeseq;
		this.coupontitle = coupontitle;
		this.discount = discount;
		this.userseq = userseq;
		this.endday = endday;
	}
	public String getEndday() {
		return endday;
	}

	public void setEndday(String endday) {
		this.endday = endday;
	}
	public int getMakeseq() {
		return makeseq;
	}
	public void setMakeseq(int makeseq) {
		this.makeseq = makeseq;
	}
	public String getCoupontitle() {
		return coupontitle;
	}
	public void setCoupontitle(String coupontitle) {
		this.coupontitle = coupontitle;
	}
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
	public int getUserseq() {
		return userseq;
	}
	public void setUserseq(int userseq) {
		this.userseq = userseq;
	}
	
	
	
	

}
