package com.ptsd.mvc.notice;

import java.util.Date;

public class NoticeDto {

	private int boardseq;
	private String boardkind;
	
	private String boardname;
	private String boardtitle;
	private String boardcontent;
	private int userseq;
	private Date boarddate;
	public int getBoardseq() {
		return boardseq;
	}
	public void setBoardseq(int boardseq) {
		this.boardseq = boardseq;
	}
	
	public String getBoardkind() {
		return boardkind;
	}
	public void setBoardkind(String boardkind) {
		this.boardkind = boardkind;
	}
	
	
	public String getBoardname() {
		return boardname;
	}
	public void setBoardname(String boardname) {
		this.boardname = boardname;
	}
	public String getBoardtitle() {
		return boardtitle;
	}
	public void setBoardtitle(String boardtitle) {
		this.boardtitle = boardtitle;
	}
	public String getBoardcontent() {
		return boardcontent;
	}
	public void setBoardcontent(String boardcontent) {
		this.boardcontent = boardcontent;
	}
	public int getUserseq() {
		return userseq;
	}
	public void setUserseq(int userseq) {
		this.userseq = userseq;
	}
	public Date getBoarddate() {
		return boarddate;
	}
	public void setBoarddate(Date boarddate) {
		this.boarddate = boarddate;
	}
	
}
