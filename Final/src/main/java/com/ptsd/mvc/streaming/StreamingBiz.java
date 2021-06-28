package com.ptsd.mvc.streaming;

import java.util.List;

public interface StreamingBiz {

	public List<StreamingDto> selectList();
	public StreamingDto selectOne(int streamingseq);
	public int insert(StreamingDto dto);
	public int delete(int streamingseq);
}
