package com.ptsd.mvc.recommand;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RecommandDaoImpl implements RecommandDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int recommandInsert(RecommandDto dto) {
		return sqlSession.insert(NAMESPACE + "recommandInsert", dto);
	}

	@Override
	public int recommandDelete(RecommandDto dto) {
		return sqlSession.delete(NAMESPACE + "recommandDelete", dto);
	}

	@Override
	public int recommandUpdate(int productseq) {
		return sqlSession.update(NAMESPACE + "recommandUpdate", productseq);
	}

	@Override
	public int recommandSelectOne(RecommandDto dto) {
		return sqlSession.selectOne(NAMESPACE + "recommandSelectOne", dto);
	}
}
