package com.ptsd.mvc.festivals;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FestivalsDetailDaoImpl implements FestivalsDetailDao {
	
	private Logger logger = LoggerFactory.getLogger(FestivalsDetailDaoImpl.class);
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 축제 상세보기
	@Override
	public FestivalsDto selectFestivalsOne(String title) {
		
		logger.info("[ FestivalsDetailDto ] selectFestivalsOne ");
		
		FestivalsDto dto = null;
		
		try {
			dto = sqlSession.selectOne(NAMESPACE + "selectFestivalsOne", title);
		} catch (Exception e) {
			logger.info("[ Error ] selectFestivalsOne");
			e.printStackTrace();
		}
		
		return dto;
	}

}
