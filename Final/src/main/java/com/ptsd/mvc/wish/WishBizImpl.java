/*package com.ptsd.mvc.wish;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class WishBizImpl implements WishBiz {

	@Autowired
	private WishDao dao;
	
	@Override
	public int insertWish(WishDto dto) {
		return dao.insertWish(dto);
	}
	
	@Override
	public int deleteWish(int wish_user_no) {
		return dao.deleteWish(wish_user_no);
	}



	@Override
	public List<BoardDto> listWish(int wish_user_no) {
		return dao.listWish(wish_user_no);
	}

	@Override
	public int wishChk(WishDto dto) {
		return dao.wishChk(dto);
	}

}
*/