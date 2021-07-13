package com.ptsd.mvc.streaming;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StreamingController {
	
	@Autowired
	private StreamingBiz biz;

	@RequestMapping("/streaming.do")
	public String streamingList(Model model) {
		
		List<StreamingDto> list = biz.selectList();
		
		model.addAttribute("list", list);
		
		return "streamingmain";
	}
	
	@RequestMapping("/streamingselect.do")
	public String streamingOne(Model model,int streamingseq) {
		
		model.addAttribute("dto", biz.selectOne(streamingseq));
		
		return "streamingselect";
	}
	
	@RequestMapping("/streaminginsert.do")
	public String streamingInsert() {
		return "streaminginsert";
	}
	
	@RequestMapping("/streamingres.do")
	public String streamingRes(StreamingDto dto) {
		
		if (biz.insert(dto) > 0) {
			return "redirect:streaming.do";
		}
		
		return "redirect:streamingres.do";
	}
	
	@RequestMapping("/streamingdel.do")
	public String streamingDelete(int streamingseq) {
		
		if (biz.delete(streamingseq) > 0) {
			return "redirect:streaming.do";
		}
		
		return "redirect:streaming.do";
	}
}
