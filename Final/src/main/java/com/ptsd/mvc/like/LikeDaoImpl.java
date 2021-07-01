package com.ptsd.mvc.like;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LikeDaoImpl implements LikeDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int likeCount(LikeDto dto) {
		
		
		
		return 0;
	}

	@Override
	public int likeInsert(LikeDto dto) {
		
		
		
		return 0;
	}

	@Override
	public int likeUpdate(int productseq) {
		
		
		
		return 0;
	}

	@Override
	public int likeDel(LikeDto dto) {
		
		
		
		return 0;
	}

}
