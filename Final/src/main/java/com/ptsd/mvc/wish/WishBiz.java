package com.ptsd.mvc.wish;

import java.util.List;

import com.ptsd.mvc.product.ProductDto;

public interface WishBiz {

	// 찜하기 목록
	public List<ProductDto> listWish(int wishuserseq);
	
	// 찜하기 추가
	public int addWish(WishDto dto);
	
	// 찜하기 삭제
	public int delWish(int wishuserseq);
	
	// 찜하기 유무 체크
	public int wishChk(WishDto dto);
	
}
