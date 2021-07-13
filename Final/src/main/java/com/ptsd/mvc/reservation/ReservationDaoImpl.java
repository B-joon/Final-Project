package com.ptsd.mvc.reservation;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReservationDaoImpl implements ReservationDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<ReservationDto> selectList(int userseq) {
		List<ReservationDto> list = new ArrayList<ReservationDto>();

		try {
			list = sqlSession.selectList(NAMESPACE + "selectList",userseq);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public ReservationDto selectOne(int reservationseq) {
		ReservationDto dto = new ReservationDto();

		try {
			dto = sqlSession.selectOne(NAMESPACE + "selectOne");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return dto;
	}

	@Override
	public int insert(ReservationDto dto) {
		int res = 0;

		try {
			res = sqlSession.insert(NAMESPACE + "insert",dto);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public int update(ReservationDto dto) {
		int res = 0;

		try {
			res = sqlSession.insert(NAMESPACE + "update",dto);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return 0;
	}

	@Override
	public int delete(int reservationseq) {
		int res = 0 ; 
		try {
			res = sqlSession.delete(NAMESPACE+"delete",reservationseq);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

}
