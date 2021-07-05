package com.ptsd.mvc.wish;

import java.util.List; 


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class WishBizImpl implements WishBiz {

	@Autowired
	private WishDao dao;
	
	@Override
	public List<WishDto> wishList() {
		return dao.wishList();
	}

	@Override
	public int wishInsert(WishDto dto) {
		return dao.wishInsert(dto);
	}

	@Override
	public int wishDelete(int wishseq) {
		return dao.wishDelete(wishseq);
	}

}
