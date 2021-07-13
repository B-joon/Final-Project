package com.ptsd.mvc.recommand;

public interface RecommandDao {

	String NAMESPACE = "recommand.";
	
	public int recommandInsert(RecommandDto dto);
	public int recommandDelete(RecommandDto dto);
	public int recommandUpdate(int productseq);
	public int recommandSelectOne(RecommandDto dto);
	
	
}
