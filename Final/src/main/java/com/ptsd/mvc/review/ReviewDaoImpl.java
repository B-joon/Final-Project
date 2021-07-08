package com.ptsd.mvc.review;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReviewDaoImpl implements ReviewDao {

	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public List<ReviewDto> selectList(int productseq) {
		
		List<ReviewDto> list = new ArrayList<ReviewDto>();
		
		try {
			list = session.selectList(NAMESPACE + "reviewList", productseq);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int reviewInsert(ReviewDto dto) {
		
		int res = 0;
		
		try {
			res = session.insert(NAMESPACE + "reivewInsert", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int reviewUpdate(ReviewDto dto) {
		
		int res = 0;
		
		try {
			res = session.update(NAMESPACE + "reviewUpdate", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int reviewDel(int reviewseq) {
		
		int res = 0;
		
		try {
			res = session.delete(NAMESPACE + "reviewDel", reviewseq);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public ReviewDto reviewOne(int reviewseq) {
		
		ReviewDto dto = new ReviewDto();
		
		try {
			dto = session.selectOne(NAMESPACE + "reviewOne", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

}
