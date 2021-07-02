package com.ptsd.mvc.like;

public interface LikeBiz {

	public LikeDto likeCount(LikeDto dto);
	public int likeInsert(LikeDto dto);
	public int likeUpdate(int productseq);
	public int likeDel(LikeDto dto);
	
}
