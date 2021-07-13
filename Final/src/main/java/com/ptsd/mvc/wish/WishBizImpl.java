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
	public int wishDelete(WishDto dto) {
		return dao.wishDelete(dto);
	}

	@Override
	public int wishCount(WishDto dto) {
		return dao.wishCount(dto);
	}

	@Override
	public int chkWish(WishDto dto) {
		return dao.chkWish(dto);
	}
	

}
