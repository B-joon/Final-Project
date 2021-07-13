package com.ptsd.mvc.recommand;

public interface RecommandBiz {

	public int recommandInsert(RecommandDto dto);
	public int recommandDelete(RecommandDto dto);
	public int recommandUpdate(int productseq);
	public int recommandSelectOne(RecommandDto dto);

}
