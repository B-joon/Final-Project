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
	public int insertWish(WishDto dto) {
		
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE + "wishinsert", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}
	
	@Override
	public int deleteWish(int wish_user_no) {
		
		int res = 0;
		
		try {
			res = sqlSession.delete(NAMESPACE + "wishdelete", wish_user_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public <BoardDto> void listWish(int wish_user_no) {
		
		List<BoardDto> list = new ArrayList<BoardDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE + "wishlist", wish_user_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int scrapChk(WishDto dto) {
		
		int res = 0;
		
		try {
			res = sqlSession.selectOne(NAMESPACE + "wishchk", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

}
