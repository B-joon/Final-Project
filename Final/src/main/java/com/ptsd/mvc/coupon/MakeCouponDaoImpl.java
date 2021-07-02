package com.ptsd.mvc.coupon;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MakeCouponDaoImpl implements MakeCouponDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<MakeCouponDto> selectList() {
		
		List<MakeCouponDto> list= new ArrayList<MakeCouponDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE+"selectList");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public MakeCouponDto selectOne(int makeseq) {
		MakeCouponDto dto = null; 
		
		try {
			dto = sqlSession.selectOne(NAMESPACE+"selectOne",makeseq);
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public int insert(MakeCouponDto dto) {
		int res = 0; 
		try {
			res = sqlSession.insert(NAMESPACE+"insert",dto);
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int update(MakeCouponDto dto) {
		
		int res = 0 ; 
		try {
			res = sqlSession.update(NAMESPACE+"update",dto);
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int delete(int makeseq) {
		int res = 0; 
		
		try {
			res = sqlSession.delete(NAMESPACE+"delete",makeseq);
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return res;
	}

}
