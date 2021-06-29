package com.ptsd.mvc.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProductBizImpl implements ProductBiz {

	@Autowired
	private ProductDao dao;
	
	@Override
	public List<ProductDto> selectAllList() {
		return null;
	}

	@Override
	public List<ProductDto> selectAreaList(int areaCode) {
		return dao.selectAreaList(areaCode);
	}
	
	@Override
	public ProductDto selectOne(int productseq) {
		return dao.selectOne(productseq);
	}

	@Override
	public int insert(ProductDto dto) {
		return dao.insert(dto);
	}

	@Override
	public int update(ProductDto dto) {
		return dao.update(dto);
	}

	@Override
	public int delete(int boardseq) {
		return dao.delete(boardseq);
	}



}
