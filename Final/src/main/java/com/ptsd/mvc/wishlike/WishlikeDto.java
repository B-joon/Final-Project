package com.ptsd.mvc.wishlike;

public class WishlikeDto {

	private int wishlikeseq;
	private int wishseq;
	private int userseq;

	public WishlikeDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public WishlikeDto(int wishlikeseq, int wishseq, int userseq) {
		super();
		this.wishlikeseq = wishlikeseq;
		this.wishseq = wishseq;
		this.userseq = userseq;
	}

	public int getWishlikeseq() {
		return wishlikeseq;
	}

	public void setWishlikeseq(int wishlikeseq) {
		this.wishlikeseq = wishlikeseq;
	}

	public int getWishseq() {
		return wishseq;
	}

	public void setWishseq(int wishseq) {
		this.wishseq = wishseq;
	}

	public int getUserseq() {
		return userseq;
	}

	public void setUserseq(int userseq) {
		this.userseq = userseq;
	}

	@Override
	public String toString() {
		return "WishlikeDto [wishlikeseq=" + wishlikeseq + ", wishseq=" + wishseq + ", userseq=" + userseq + "]";
	}

}
