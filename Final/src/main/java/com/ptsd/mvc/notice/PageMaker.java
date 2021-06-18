package com.ptsd.mvc.notice;

public class PageMaker {

	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;

	private PagingCriteria cri;

	public PageMaker(PagingCriteria cri, int total) {
		this.cri = cri;
		int realEnd = (int) (Math.ceil((total * 1.0) / cri.getAmount()));
		this.endPage = (int) (Math.ceil(cri.getPageNum() / 10.0)) * 10;
		this.startPage = getEndPage() - 9;

		if (realEnd < this.endPage) {
			this.endPage = realEnd;
		}

		this.next = getEndPage() < realEnd;
		this.prev = getStartPage() > 1;

	}

	public PagingCriteria getCri() {
		return cri;
	}

	public void setCri(PagingCriteria cri) {
		this.cri = cri;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	@Override
	public String toString() {
		return "PageMaker [startPage=" + startPage + ", endPage=" + endPage + ", prev=" + prev + ", next=" + next + "]";
	}

}