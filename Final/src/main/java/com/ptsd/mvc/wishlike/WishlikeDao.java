package com.ptsd.mvc.wishlike;

public interface WishlikeDao {

	String NAMESPACE = "wishlike.";
	
	public int wishlikeCount(WishlikeDto dto);
	public int wishlikeInsert(WishlikeDto dto);
	public int wishlikeUpdate(int wishseq);
	public int wishlikeDelete(WishlikeDto dto);
}
