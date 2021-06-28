package com.ptsd.mvc.streaming;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StreamingBizImpl implements StreamingBiz {
	
	@Autowired
	private StreamingDao dao;

	@Override
	public List<StreamingDto> selectList() {
		return dao.selectList();
	}

	@Override
	public StreamingDto selectOne(int streamingseq) {
		return dao.selectOne(streamingseq);
	}

	@Override
	public int insert(StreamingDto dto) {
		return dao.insert(dto);
	}

	@Override
	public int delete(int streamingseq) {
		return dao.delete(streamingseq);
	}

}
