package com.ptsd.mvc.reservation;

import java.util.Date;

public class ReservationDto {

	private int reservationseq;
	private int userseq;
	private int productseq;
	private int price;
	private String paycontent;
	private Date paydate;
	private int couponseq;
	
	public ReservationDto() {
		
	}

	public ReservationDto(int reservationseq, int userseq, int productseq, int price, String paycontent, Date paydate,
			int couponseq) {
		this.reservationseq = reservationseq;
		this.userseq = userseq;
		this.productseq = productseq;
		this.price = price;
		this.paycontent = paycontent;
		this.paydate = paydate;
		this.couponseq = couponseq;
	}

	public int getReservationseq() {
		return reservationseq;
	}

	public void setReservationseq(int reservationseq) {
		this.reservationseq = reservationseq;
	}

	public int getUserseq() {
		return userseq;
	}

	public void setUserseq(int userseq) {
		this.userseq = userseq;
	}

	public int getProductseq() {
		return productseq;
	}

	public void setProductseq(int productseq) {
		this.productseq = productseq;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getPaycontent() {
		return paycontent;
	}

	public void setPaycontent(String paycontent) {
		this.paycontent = paycontent;
	}

	public Date getPaydate() {
		return paydate;
	}

	public void setPaydate(Date paydate) {
		this.paydate = paydate;
	}

	public int getCouponseq() {
		return couponseq;
	}

	public void setCouponseq(int couponseq) {
		this.couponseq = couponseq;
	}
	
}
