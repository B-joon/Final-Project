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
	public int insert(ProductDto dto) {
		return dao.insert(dto);
	}

	@Override
	public int update(ProductDto dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(int boardseq) {
		// TODO Auto-generated method stub
		return 0;
	}

}
