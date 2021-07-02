package com.ptsd.mvc.review;

import java.sql.Date;

public class ReviewDto {

	private int reviewseq;
	private int productseq;
	private String reviewname;
	private String reviewcontent;
	private Date reviewdate;
	public int getReviewseq() {
		return reviewseq;
	}
	public void setReviewseq(int reviewseq) {
		this.reviewseq = reviewseq;
	}
	public int getProductseq() {
		return productseq;
	}
	public void setProductseq(int productseq) {
		this.productseq = productseq;
	}
	public String getReviewname() {
		return reviewname;
	}
	public void setReviewname(String reviewname) {
		this.reviewname = reviewname;
	}
	public String getReviewcontent() {
		return reviewcontent;
	}
	public void setReviewcontent(String reviewcontent) {
		this.reviewcontent = reviewcontent;
	}
	public Date getReviewdate() {
		return reviewdate;
	}
	public void setReviewdate(Date reviewdate) {
		this.reviewdate = reviewdate;
	}
	
	
	
}
