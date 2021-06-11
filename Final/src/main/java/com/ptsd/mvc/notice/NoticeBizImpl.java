package com.ptsd.mvc.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NoticeBizImpl implements NoticeBiz {
	
	@Autowired
	private NoticeDao dao;

	@Override
	public List<NoticeDto> selectList() {
		return dao.selectList();
	}

	@Override
	public NoticeDto selectOne(int boardseq) {
		return dao.selectOne(boardseq);
	}

	@Override
	public int insert(NoticeDto dto) {
		return dao.insert(dto);
	}

	@Override
	public int update(NoticeDto dto) {
		return dao.update(dto);
	}

	@Override
	public int delete(int boardseq) {
		return dao.delete(boardseq);
	}

}
