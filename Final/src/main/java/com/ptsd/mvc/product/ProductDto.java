package com.ptsd.mvc.product;

public class ProductDto {

	private int productseq;
	// 상품번호
	private String category;
	// 카테고리
	private String productname;
	// 상품명
	private String startdate;
	// 시작일
	private String enddate;
	// 종료일
	private String thumbimg;
	// 이미지 URL
	private String productcontent;
	// 상품내용
	private int areacode;
	// 지역번호
	private String address;
	// 주소
	private String tellnumber;
	// 전화번호
	private String runtime;
	// 관람시간
	private String rating;
	// 관람등급
	private int seatcount;
	// 관객수
	private int likecount;
	// 좋아요수
	private int wishcount;
	// 찜하기수
	private int productcount;
	// 조회수

	
	public ProductDto() {
		
	}
	public ProductDto(int productseq, String category, String productname, String startdate, String enddate,
			String thumbimg, String productcontent, int areacode, String address, String tellnumber, String runtime, String rating, int seatcount, int likecount,
			int wishcount, int productcount) {
		this.productseq = productseq;
		this.category = category;
		this.productname = productname;
		this.startdate = startdate;
		this.enddate = enddate;
		this.thumbimg = thumbimg;
		this.productcontent = productcontent;
		this.areacode = areacode;
		this.address = address;
		this.tellnumber = tellnumber;
		this.runtime = runtime;
		this.rating = rating;
		this.seatcount = seatcount;
		this.likecount = likecount;
		this.wishcount = wishcount;
		this.productcount = productcount;
	}
	public int getProductseq() {
		return productseq;
	}
	public void setProductseq(int productseq) {
		this.productseq = productseq;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getProductname() {
		return productname;
	}
	public void setProductname(String productname) {
		this.productname = productname;
	}
	public String getStartdate() {
		return startdate;
	}
	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}
	public String getEnddate() {
		return enddate;
	}
	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}
	public String getThumbimg() {
		return thumbimg;
	}
	public void setThumbimg(String thumbimg) {
		this.thumbimg = thumbimg;
	}
	public String getProductcontent() {
		return productcontent;
	}
	public void setProductcontent(String productcontent) {
		this.productcontent = productcontent;
	}
	public int getAreacode() {
		return areacode;
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
	public void setAreacode(int areacode) {
		this.areacode = areacode;
	}
	public String getRuntime() {
		return runtime;
	}
	public void setRuntime(String runtime) {
		this.runtime = runtime;
	}
	public String getRating() {
		return rating;
	}
	public void setRating(String rating) {
		this.rating = rating;
	}
	public int getSeatcount() {
		return seatcount;
	}
	public void setSeatcount(int seatcount) {
		this.seatcount = seatcount;
	}
	public int getLikecount() {
		return likecount;
	}
	public void setLikecount(int likecount) {
		this.likecount = likecount;
	}
	public int getWishcount() {
		return wishcount;
	}
	public void setWishcount(int wishcount) {
		this.wishcount = wishcount;
	}
	public int getProductcount() {
		return productcount;
	}
	public void setProductcount(int count) {
		this.productcount = count;
	}

}
