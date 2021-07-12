package com.ptsd.mvc.reservation;

import java.util.Date;

public class ReservationDto {

	private int reservationseq;
	private int userseq;
	private String productname;
	private int price;
	private String playdate;
	private int people;
	private Date paydate;

	public ReservationDto() {

	}

	public ReservationDto(int reservationseq, int userseq, String productname, int price, String playdate, int people,
			Date paydate) {
		super();
		this.reservationseq = reservationseq;
		this.userseq = userseq;
		this.productname = productname;
		this.price = price;
		this.playdate = playdate;
		this.people = people;
		this.paydate = paydate;
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

	public String getProductname() {
		return productname;
	}

	public void setProductname(String productname) {
		this.productname = productname;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getPlaydate() {
		return playdate;
	}

	public void setPlaydate(String playdate) {
		this.playdate = playdate;
	}

	public int getPeople() {
		return people;
	}

	public void setPeople(int people) {
		this.people = people;
	}

	public Date getPaydate() {
		return paydate;
	}

	public void setPaydate(Date paydate) {
		this.paydate = paydate;
	}

}
