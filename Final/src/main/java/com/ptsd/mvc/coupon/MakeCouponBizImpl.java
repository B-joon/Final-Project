package com.ptsd.mvc.coupon;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MakeCouponBizImpl implements MakeCouponBiz {

	@Autowired
	private MakeCouponDao dao;
	
	
	@Override
	public List<MakeCouponDto> selectList() {
		return dao.selectList();
	}

	@Override
	public MakeCouponDto selectOne(int makeseq) {
		return dao.selectOne(makeseq);
	}

	@Override
	public int insert(MakeCouponDto dto) {
		return dao.insert(dto);
	}

	@Override
	public int update(MakeCouponDto dto) {
		return dao.update(dto);
	}

	@Override
	public int delete(int makeseq) {
		return dao.delete(makeseq);
	}

}
