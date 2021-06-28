package com.ptsd.mvc.streaming;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class StreamingDaoImpl implements StreamingDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<StreamingDto> selectList() {
		
		List<StreamingDto> list = new ArrayList<StreamingDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE + "selectList");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public StreamingDto selectOne(int streamingseq) {
		
		StreamingDto dto = new StreamingDto();
		
		try {
			dto = sqlSession.selectOne(NAMESPACE + "selectOne", streamingseq);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}
	
	@Override
	public int insert(StreamingDto dto) {
		
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE + "insert", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}
	
	@Override
	public int delete(int streamingseq) {
		
		int res = 0;
		
		try {
			res = sqlSession.delete(NAMESPACE + "delete", streamingseq);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

}
