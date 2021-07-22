package com.ptsd.mvc.wish;

import java.util.List; 

public interface WishBiz {

	public List<WishDto> wishList(int userseq); 
	public int wishInsert(WishDto dto);
	public int wishDelete(WishDto dto);
	public int wishCount(WishDto dto);
	public int chkWish(WishDto dto);
	
}
