package com.ptsd.mvc.like;

public interface LikeDao {

	public int likeCount(LikeDto dto);
	public int likeInsert(LikeDto dto);
	public int likeUpdate(int productseq);
	public int likeDel(LikeDto dto);
	
}
