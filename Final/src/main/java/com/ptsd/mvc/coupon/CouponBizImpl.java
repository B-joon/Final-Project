package com.ptsd.mvc.coupon;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CouponBizImpl implements CouponBiz {

	@Autowired
	private CouponDao dao;
	
	@Override
	public List<CouponDto> selectList() {
		return dao.selectList();
	}

	@Override
	public int insert(CouponDto dto) {
		return dao.insert(dto);
	}

	@Override
	public int update(CouponDto dto) {
		return dao.update(dto);
	}

	@Override
	public int delete(int couponseq) {
		return dao.delete(couponseq);
	}

	@Override
	public CouponDto selectOne(int couponseq) {
		// TODO Auto-generated method stub
		return dao.selectOne(couponseq);
	}

}
