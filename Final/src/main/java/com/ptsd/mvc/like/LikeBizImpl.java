package com.ptsd.mvc.like;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LikeBizImpl implements LikeBiz {

	@Autowired
	private LikeDao dao;
	
	@Override
	public int likeCount(LikeDto dto) {
		return dao.likeCount(dto);
	}

	@Override
	public int likeInsert(LikeDto dto) {
		return dao.likeInsert(dto);
	}

	@Override
	public int likeUpdate(int productseq) {
		return dao.likeUpdate(productseq);
	}

	@Override
	public int likeDel(LikeDto dto) {
		return dao.likeDel(dto);
	}

}
