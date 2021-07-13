package com.ptsd.mvc.festivals;

import java.util.List;


public interface FestivalsListDao {
	
	String NAMESPACE="festivals.";
	
	public List<FestivalsDto> selectFestivalsList();


}
