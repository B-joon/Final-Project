package com.ptsd.mvc.like;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LikeDaoImpl implements LikeDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int likeCount(LikeDto dto) {		// 좋아요 카운팅
		return sqlSession.selectOne(NAMESPACE + "likeCnt", dto);
	}

	@Override
	public int likeInsert(LikeDto dto) { // 좋아요 + 1
		
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE + "likeInsert", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int likeUpdate(int productseq) {
		
		int res = 0;
		
		try {
			res = sqlSession.update(NAMESPACE + "likeUpdate", productseq);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int likeDel(LikeDto dto) {
		
		int res = 0;
		
		try {
			res = sqlSession.delete(NAMESPACE + "likeDel", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

}
