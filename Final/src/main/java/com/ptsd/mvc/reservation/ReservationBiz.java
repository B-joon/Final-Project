package com.ptsd.mvc.reservation;

import java.util.List;

public interface ReservationBiz {
	

	public List<ReservationDto> selectList(int userseq);
	public ReservationDto selectOne(int reservationseq);
	public int insert(ReservationDto dto);
	public int update(ReservationDto dto);
	public int delete(int reservationseq);

}
