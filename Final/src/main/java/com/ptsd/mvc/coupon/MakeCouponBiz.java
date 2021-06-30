package com.ptsd.mvc.coupon;

import java.util.List;

public interface MakeCouponBiz {
	

	public List<MakeCouponDto> selectList();

	public MakeCouponDto selectOne(int makeseq);

	public int insert(MakeCouponDto dto);

	public int update(MakeCouponDto dto);

	public int delete(int makeseq);

}
