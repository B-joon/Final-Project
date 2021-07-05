package com.ptsd.mvc.wish;


public class WishDto {

	private int wishseq;
	private int productseq;
	private int userseq;
	private String productname;
	private String thumbimg;
	private String address;
	private String tellnumber;
	private int price;

	public WishDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public WishDto(int wishseq, int productseq, int userseq, String productname, String thumbimg, String address,
			String tellnumber, int price) {
		super();
		this.wishseq = wishseq;
		this.productseq = productseq;
		this.userseq = userseq;
		this.productname = productname;
		this.thumbimg = thumbimg;
		this.address = address;
		this.tellnumber = tellnumber;
		this.price = price;
	}

	public int getWishseq() {
		return wishseq;
	}

	public void setWishseq(int wishseq) {
		this.wishseq = wishseq;
	}

	public int getProductseq() {
		return productseq;
	}

	public void setProductseq(int productseq) {
		this.productseq = productseq;
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

	public String getThumbimg() {
		return thumbimg;
	}

	public void setThumbimg(String thumbimg) {
		this.thumbimg = thumbimg;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getTellnumber() {
		return tellnumber;
	}

	public void setTellnumber(String tellnumber) {
		this.tellnumber = tellnumber;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "WishDto [wishseq=" + wishseq + ", productseq=" + productseq + ", userseq=" + userseq + ", productname="
				+ productname + ", thumbimg=" + thumbimg + ", address=" + address + ", tellnumber=" + tellnumber
				+ ", price=" + price + "]";
	}


}
