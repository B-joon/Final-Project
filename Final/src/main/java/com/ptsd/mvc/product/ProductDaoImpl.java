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
		List<ProductDto> list = new ArrayList<ProductDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE+"selectAllList");			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<ProductDto> selectAreaList(int areacode) {
		List<ProductDto> list = new ArrayList<ProductDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE+"selectlist", areacode);			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
	
	@Override
	public ProductDto selectOne(int productseq) {
		
		ProductDto dto = new ProductDto();
		
		try {
			dto = sqlSession.selectOne(NAMESPACE+"selectone", productseq);			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
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
		
		int res = 0;
		
		try {
			res = sqlSession.update(NAMESPACE + "update", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int delete(int boardseq) {
		int res = 0;
		
		try {
			res = sqlSession.delete(NAMESPACE + "delete", boardseq);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}



}
