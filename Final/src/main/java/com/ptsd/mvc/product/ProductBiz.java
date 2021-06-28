package com.ptsd.mvc.product;

import java.util.List;

public interface ProductBiz {

	public List<ProductDto> selectAllList();
	// 전체 상품 리스트
	public List<ProductDto> selectAreaList(int areaCode);
	// 특정 지역 상품 리스트
	public int insert(ProductDto dto);
	public int update(ProductDto dto);
	public int delete(int boardseq);
	
}
