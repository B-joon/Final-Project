package com.ptsd.mvc.review;

import java.util.List;

public interface ReviewDao {

	String NAMESPACE = "review.";
	
	public List<String> selectList();
	public int reviewInsert(ReviewDto dto);
	public int reviewUpdate(ReviewDto dto);
	public int reviewDel(int reviewseq);
	
	
}
