package com.ptsd.mvc.wish;

import java.util.List;

public interface WishBiz {

	// 찜하기 추가 
	public int insertWish(WishDto dto);
	
	// 찜하기 삭제
	public int deleteWish(int wish_user_no);
	
	// 찜하기 목록
	public List<BoardDto> listWish(int wish_user_no);
	
	// 찜하기 유무 체크
	public int wishChk(WishDto dto);
}
