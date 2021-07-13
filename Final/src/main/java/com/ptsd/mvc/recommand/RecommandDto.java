package com.ptsd.mvc.recommand;

public class RecommandDto {

	private int recommandseq;
	private int userseq;
	private int productseq;

	public RecommandDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public RecommandDto(int recommandseq, int userseq, int productseq) {
		super();
		this.recommandseq = recommandseq;
		this.userseq = userseq;
		this.productseq = productseq;
	}

	public int getRecommandseq() {
		return recommandseq;
	}

	public void setRecommandseq(int recommandseq) {
		this.recommandseq = recommandseq;
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

	@Override
	public String toString() {
		return "RecommandDto [recommandseq=" + recommandseq + ", userseq=" + userseq + ", productseq=" + productseq
				+ "]";
	}

}
