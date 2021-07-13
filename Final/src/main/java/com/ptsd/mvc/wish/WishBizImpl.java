package com.ptsd.mvc.wish;

import java.util.List; 


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class WishBizImpl implements WishBiz {

	@Autowired
	private WishDao dao;
	
	@Override
	public List<WishDto> wishList(int userseq ) {
		return dao.wishList(userseq);
	}

	@Override
	public int wishInsert(WishDto dto) {
		return dao.wishInsert(dto);
	}

	@Override
	public int wishDelete(int wishseq) {
		return dao.wishDelete(wishseq);
	}

	@Override
	public int wishCount(int productseq, int userseq) {
		return dao.wishCount(productseq, userseq);
	}
	

}
