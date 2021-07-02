package com.ptsd.mvc.wish;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ptsd.mvc.product.ProductDto;

@Repository
public class WishDaoImpl implements WishDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<ProductDto> listWish(int wishuserseq) {
		
		List<ProductDto> list = new ArrayList<ProductDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE + "wishList", wishuserseq);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int addWish(WishDto dto) {
		
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE + "addwish", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int delWish(int wishuserseq) {
		
		int res = 0;
		
		try {
			res = sqlSession.delete(NAMESPACE + "delwish", wishuserseq);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int wishChk(WishDto dto) {
		
		int res = 0;
		
		try {
			res = sqlSession.selectOne(NAMESPACE + "wishchk", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}


}
