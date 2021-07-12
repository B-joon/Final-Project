package com.ptsd.mvc.wish;

import java.util.ArrayList;  

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class WishDaoImpl implements WishDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<WishDto> wishList(int userseq) {

		List<WishDto> list = new ArrayList<WishDto>();

		try {
			list = sqlSession.selectList(NAMESPACE + "wishList", userseq);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int wishInsert(WishDto dto) {
		
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE + "wishInsert", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int wishDelete(int wishseq) {
		
		int res = 0;
		
		try {
			res = sqlSession.delete(NAMESPACE + "wishDelete", wishseq);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
		

}
