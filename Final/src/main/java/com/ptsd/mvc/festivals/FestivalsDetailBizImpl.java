package com.ptsd.mvc.festivals;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FestivalsDetailBizImpl implements FestivalsDetailBiz {
	
	@Autowired
	private FestivalsDetailDao festivalsdetaildao;
	
	// 축제 상세 보기
	@Override
	public FestivalsDto selectFestivalsOne(String title) {
		return festivalsdetaildao.selectFestivalsOne(title);
	}

}
