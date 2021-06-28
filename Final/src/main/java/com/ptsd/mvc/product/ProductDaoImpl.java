package com.ptsd.mvc.product;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProductDaoImpl implements ProductDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<ProductDto> selectAllList() {
		return null;
	}

	@Override
	public List<ProductDto> selectAreaList(int areaCode) {
		List<ProductDto> list = new ArrayList<ProductDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE+"select", areaCode);			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public int insert(ProductDto dto) {
		
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE + "insert", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return res;
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
