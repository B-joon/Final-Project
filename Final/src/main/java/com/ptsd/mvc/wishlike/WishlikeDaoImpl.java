package com.ptsd.mvc.wishlike;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class WishlikeDaoImpl implements WishlikeDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int wishlikeCount(WishlikeDto dto) {
		return sqlSession.selectOne(NAMESPACE + "wishlikeCnt", dto);
	}

	@Override
	public int wishlikeInsert(WishlikeDto dto) {
		
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE + "wishlikeInsert", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int wishlikeUpdate(int wishseq) {
		
		int res = 0;
		
		try {
			res = sqlSession.update(NAMESPACE + "wishlikeUpdate", wishseq);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int wishlikeDelete(WishlikeDto dto) {
		
		int res = 0;
		
		try {
			res = sqlSession.delete(NAMESPACE + "wishlikeDelete", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

	
}
