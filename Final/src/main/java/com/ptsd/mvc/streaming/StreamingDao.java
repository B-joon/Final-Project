package com.ptsd.mvc.streaming;

import java.util.List;

public interface StreamingDao {
	
	String NAMESPACE = "streaming.";

	public List<StreamingDto> selectList();
	public StreamingDto selectOne(int streamingseq);
	public int insert(StreamingDto dto);
	public int delete(int streamingseq);
}
