package com.ptsd.mvc.festivals;

import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FestivalsListBizImpl implements FestivalsListBiz {
	
	@Autowired
	private FestivalsListDao festivalslistdao;

	@Override
	public List<FestivalsDto> selectFestivalsList() {
		
		return festivalslistdao.selectFestivalsList();
	}


	@Override
	public List<FestivalsDto> searchToFestivalsList(JSONObject obj) {
		List<FestivalsDto> list = new ArrayList<FestivalsDto>();
		int result = obj.getJSONObject("hits").getJSONObject("total").getInt("value");
		
		
		if(result != 0) {
			JSONArray arr = obj.getJSONObject("hits").getJSONArray("hits");
			
			for(int i=0; i<arr.length(); i++) {
				String title = arr.getJSONObject(i).getJSONObject("_source").getString("title");
				String addr1 = arr.getJSONObject(i).getJSONObject("_source").getString("addr1");
				String firstimage = arr.getJSONObject(i).getJSONObject("_source").getString("firstimage");
				String tel = arr.getJSONObject(i).getJSONObject("_source").getString("tel");
			
				FestivalsDto dto = new FestivalsDto();
				
				dto.setTitle(title);
				dto.setAddr1(addr1);
				dto.setFirstimage(firstimage);	
				dto.setTel(tel);
				
				list.add(dto);

			}
		}
				
		return list;
	}
	
}
