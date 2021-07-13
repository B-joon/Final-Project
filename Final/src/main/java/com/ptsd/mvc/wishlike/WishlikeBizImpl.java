package com.ptsd.mvc.wishlike;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class WishlikeBizImpl implements WishlikeBiz {

	@Autowired
	private WishlikeDao dao;
	
	@Override
	public int wishlikeCount(WishlikeDto dto) {
		return dao.wishlikeCount(dto);
	}

	@Override
	public int wishlikeInsert(WishlikeDto dto) {
		return dao.wishlikeInsert(dto);
	}

	@Override
	public int wishlikeUpdate(int wishseq) {
		return dao.wishlikeUpdate(wishseq);
	}

	@Override
	public int wishlikeDelete(WishlikeDto dto) {
		return dao.wishlikeDelete(dto);
	}

}
