package com.ptsd.mvc.coupon;

import java.util.List;

public interface CouponDao {
	
	String NAMESPACE = "coupon.";
	
	public List<CouponDto> selectList(); 
	public CouponDto selectOne(int couponseq);
	public int insert(CouponDto dto);
	public int update(CouponDto dto);
	public int DailyDelete(String endday);

}
