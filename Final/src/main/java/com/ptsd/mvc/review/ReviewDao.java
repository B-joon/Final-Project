package com.ptsd.mvc.review;

import java.util.List;

public interface ReviewDao {

	String NAMESPACE = "review.";
	
	public List<ReviewDto> selectList(int productseq);
	public int reviewInsert(ReviewDto dto);
	public int reviewUpdate(ReviewDto dto);
	public int reviewDel(int reviewseq);
	
	
}
