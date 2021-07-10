package com.ptsd.mvc.wishlike;

public interface WishlikeBiz {

		public int wishlikeCount(WishlikeDto dto);
		public int wishlikeInsert(WishlikeDto dto);
		public int wishlikeUpdate(int wishseq);
		public int wishlikeDelete(WishlikeDto dto);
		
	}