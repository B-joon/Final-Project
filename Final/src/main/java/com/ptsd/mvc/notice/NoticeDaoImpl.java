package com.ptsd.mvc.notice;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeDaoImpl implements NoticeDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<NoticeDto> selectList(PagingCriteria paging) {
		
		List<NoticeDto> list = new ArrayList<NoticeDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE + "selectList", paging);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	@Override
	public int totalCnt() {
		
		int res = 0;
		
		try {
			res = sqlSession.selectOne(NAMESPACE + "totalCnt");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public NoticeDto selectOne(int boardseq) {
		
		NoticeDto dto = new NoticeDto();
		
		try {
			dto = sqlSession.selectOne(NAMESPACE + "selectOne", boardseq);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public int insert(NoticeDto dto) {
		
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE + "insert", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int update(NoticeDto dto) {
		
		int res = 0;
		
		try {
			res = sqlSession.update(NAMESPACE + "update", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int delete(int boardseq) {
		
		int res = 0;
		
		try {
			res = sqlSession.delete(NAMESPACE + "delete", boardseq);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

}
