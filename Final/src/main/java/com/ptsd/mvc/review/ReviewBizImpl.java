package com.ptsd.mvc.review;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReviewBizImpl implements ReviewBiz {
	
	@Autowired
	private ReviewDao dao;

	@Override
	public List<ReviewDto> selectList(int productseq) {
		return dao.selectList(productseq);
	}

	@Override
	public int reviewInsert(ReviewDto dto) {
		return dao.reviewInsert(dto);
	}

	@Override
	public int reviewUpdate(ReviewDto dto) {
		return dao.reviewUpdate(dto);
	}

	@Override
	public int reviewDel(int reviewseq) {
		return dao.reviewDel(reviewseq);
	}

}
