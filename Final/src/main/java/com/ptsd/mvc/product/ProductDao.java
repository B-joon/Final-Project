package com.ptsd.mvc.product;

import java.util.List;

public interface ProductDao {

	String NAMESPACE = "product.";
	
	public List<ProductDto> selectAllList();
	// 전체 상품 리스트
	public List<ProductDto> selectAreaList(int areacode);
	// 지역별 상품 리스트
	public ProductDto selectOne(int productseq);
	// 상품 1개 셀렉트
	public int insert(ProductDto dto);
	public int update(ProductDto dto);
	public int delete(int boardseq);
	
}
