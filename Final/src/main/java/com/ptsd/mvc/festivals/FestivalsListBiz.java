package com.ptsd.mvc.festivals;

import java.util.List;

import org.json.JSONObject;

public interface FestivalsListBiz {

	public List<FestivalsDto> selectFestivalsList();
	
	public List<FestivalsDto> searchToFestivalsList(JSONObject search_obj);


}
