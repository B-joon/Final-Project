package com.ptsd.mvc.wish;

public class WishDto {

	private int wishno;
	private int wishuserseq;
	private int wishproductseq;

	public WishDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public WishDto(int wishno, int wishuserseq, int wishproductseq) {
		super();
		this.wishno = wishno;
		this.wishuserseq = wishuserseq;
		this.wishproductseq = wishproductseq;
	}

	public int getWishno() {
		return wishno;
	}

	public void setWishno(int wishno) {
		this.wishno = wishno;
	}

	public int getWishuserseq() {
		return wishuserseq;
	}

	public void setWishuserseq(int wishuserseq) {
		this.wishuserseq = wishuserseq;
	}

	public int getWishproductseq() {
		return wishproductseq;
	}

	public void setWishproductseq(int wishproductseq) {
		this.wishproductseq = wishproductseq;
	}

}
