package com.ptsd.mvc.wish;

import java.util.List; 


public interface WishDao {

	String NAMESPACE = "wish.";
	
	public List<WishDto> wishList(int userseq);
	public int wishInsert(WishDto dto);
	public int wishDelete(int wishseq);
}
