package com.ptsd.mvc.review;

import java.util.List;

public interface ReviewBiz {

	public List<ReviewDto> selectList(int productseq);
	public int reviewInsert(ReviewDto dto);
	public int reviewUpdate(ReviewDto dto);
	public int reviewDel(int reviewseq);
	public ReviewDto reviewOne(int reviewseq);
	
}
