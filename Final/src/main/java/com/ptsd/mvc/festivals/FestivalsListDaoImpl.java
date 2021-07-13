package com.ptsd.mvc.festivals;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.LoggerFactory;
import org.apache.ibatis.session.SqlSession;
import org.json.JSONObject;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FestivalsListDaoImpl implements FestivalsListDao {
	

	private Logger logger = LoggerFactory.getLogger(FestivalsListDaoImpl.class);

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<FestivalsDto> selectFestivalsList() {
		
		List<FestivalsDto> list = null;

		try {
			list = sqlSession.selectList(NAMESPACE + "searchFestivalsList");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}



}
