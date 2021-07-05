package com.ptsd.mvc.review;

import java.sql.Date;

public class ReviewDto {

	private int reviewseq;
	private int productseq;
	private int userseq;
	private String reviewname;
	private String reviewcontent;
	private int reviewlikecnt;
	private Date reviewdate;
	private int reviewcnt;
	
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
	public int getUserseq() {
		return userseq;
	}
	public void setUserseq(int userseq) {
		this.userseq = userseq;
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
	public int getReviewlikecnt() {
		return reviewlikecnt;
	}
	public void setReviewlikecnt(int reviewlikecnt) {
		this.reviewlikecnt = reviewlikecnt;
	}
	public Date getReviewdate() {
		return reviewdate;
	}
	public void setReviewdate(Date reviewdate) {
		this.reviewdate = reviewdate;
	}
	public int getReviewcnt() {
		return reviewcnt;
	}
	public void setReviewcnt(int reviewcnt) {
		this.reviewcnt = reviewcnt;
	}
	
}
