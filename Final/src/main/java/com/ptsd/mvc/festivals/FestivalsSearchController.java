package com.ptsd.mvc.festivals;

import org.slf4j.LoggerFactory;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.net.ssl.HttpsURLConnection;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FestivalsSearchController {
	private Logger logger = LoggerFactory.getLogger(FestivalsSearchController.class);

	@Autowired
	private FestivalsListBiz festivalslistbiz;
	
	
	@RequestMapping("/search.do")
	public String festivalsList(Model model, String keyword) throws Exception {

		logger.info("[ festivals List ]");

		
		// -----------엘라스틱 검색 결과 가져오기---------
		String search = "";
		System.out.println("search : " + keyword);

		String search_addr;

		if (keyword == null) {
			search_addr = "https://search-ptsdkh-kyml7xeoi6xdkyqcba5muid5bq.ap-northeast-2.es.amazonaws.com:443/festivals/_search?pretty&size=100";
		} else {
			try {
				search = URLEncoder.encode(keyword, "UTF-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			search_addr = "https://search-ptsdkh-kyml7xeoi6xdkyqcba5muid5bq.ap-northeast-2.es.amazonaws.com:443/festivals/_search?q=" + search + "&pretty&size=100";
		}
		
		System.out.println("search_addr : " + search_addr);
		

		URL search_url = new URL(search_addr);
		HttpsURLConnection search_conn = (HttpsURLConnection) search_url.openConnection();
		search_conn.setDoOutput(true);
		
		System.out.println("search_conn : " + search_conn);

		BufferedReader search_br = new BufferedReader(new InputStreamReader(search_conn.getInputStream()));
		StringBuilder search_sb = new StringBuilder();
		String search_res = "";

		while ((search_res = search_br.readLine()) != null) {
			search_sb.append(search_res);
		}

		JSONObject search_obj = new JSONObject(search_sb.toString());
		search_br.close();

		List<FestivalsDto> searchList = festivalslistbiz.searchToFestivalsList(search_obj);
		System.out.println(search_obj);
		
		System.out.println(searchList);
		
		// -----------------------검색 결과 가져오기 끝----------------------
		
		List<FestivalsDto> list = new ArrayList<>();
		
		for(int i=0; i<searchList.size(); i++) {
			searchList.get(i).setTitle(searchList.get(i).getTitle());
			list.add(searchList.get(i));

		}

		model.addAttribute("list", list);
		model.addAttribute("keyword", keyword);
		

		return "searchfestivalslist";
	}
	

}
