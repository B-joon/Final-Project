package com.ptsd.mvc.reservation;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReservationBizImpl implements ReservationBiz {
	@Autowired
	private ReservationDao dao;
	
	@Override
	public List<ReservationDto> selectList() {
		return dao.selectList();
	}


	@Override
	public ReservationDto selectOne(int reservationseq) {
		return dao.selectOne(reservationseq);
	}

	@Override
	public int insert(ReservationDto dto) {
		return dao.insert(dto);
	}

	@Override
	public int update(ReservationDto dto) {
		return dao.update(dto);
	}

	@Override
	public int delete(int reservationseq) {
		return dao.delete(reservationseq);
	}

}
