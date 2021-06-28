package com.ptsd.mvc.product;

import java.util.List;

public interface ProductBiz {

	public List<ProductDto> selectAllList();
	// ��ü ��ǰ ����Ʈ
	public List<ProductDto> selectAreaList(int areaCode);
	// Ư�� ���� ��ǰ ����Ʈ
	public int insert(ProductDto dto);
	public int update(ProductDto dto);
	public int delete(int boardseq);
	
}
