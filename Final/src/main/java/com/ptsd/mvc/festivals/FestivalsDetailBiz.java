package com.ptsd.mvc.festivals;

public interface FestivalsDetailBiz {
	
	// List에서 클릭 시 넘어오는 festivals의 title로 상세보기
	public FestivalsDto selectFestivalsOne(String title);

}
