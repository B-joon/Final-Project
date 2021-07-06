package com.ptsd.mvc.coupon;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("DeleteCouponImpl")
public class DeleteCouponImpl implements DeleteCoupon {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public boolean DailyDelete(String endday) {
		
		try {
			if(sqlSession.delete("DailyDelete",endday) == 0 ) {
				return false;
				
			}else {
				return true;
			}
		} catch (Exception e) {
			
			e.printStackTrace();
			return false;
		}

		
	}

}
