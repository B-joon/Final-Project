package com.ptsd.mvc.festivals;

public interface FestivalsDetailDao {
	
	String NAMESPACE = "festivals.";
	
	// List에서 해당 축제 클릭시 넘어오는 title로 상세보기
	public FestivalsDto selectFestivalsOne(String title);

}
