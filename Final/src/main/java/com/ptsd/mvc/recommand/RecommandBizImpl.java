package com.ptsd.mvc.recommand;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RecommandBizImpl implements RecommandBiz {

	@Autowired
	private RecommandDao dao;
	
	@Override
	public int recommandInsert(RecommandDto dto) {
		return dao.recommandInsert(dto);		
	}

	@Override
	public int recommandDelete(RecommandDto dto) {
		return dao.recommandDelete(dto);	
	}
	
	@Override
	public int recommandUpdate(int productseq) {
		return dao.recommandUpdate(productseq);
	}

	@Override
	public int recommandSelectOne(RecommandDto dto) {
		return dao.recommandSelectOne(dto);
	}

}
