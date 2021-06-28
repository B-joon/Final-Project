package com.ptsd.mvc.product;

import java.util.List;

public interface ProductDao {

	String NAMESPACE = "product.";
	
	public List<ProductDto> selectAllList();
	public List<ProductDto> selectAreaList(int areaCode);
	public int insert(ProductDto dto);
	public int update(ProductDto dto);
	public int delete(int boardseq);
	
}
