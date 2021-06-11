package com.ptsd.mvc.notice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class NoticeController {

	@Autowired
	private NoticeBiz biz;
	
	@RequestMapping("/noticelist.do")
	public String selectList(Model model) {
		
		model.addAttribute("list", biz.selectList());
		
		return "noticelist";
	}
	
	@RequestMapping("/noticeone.do")
	public String selectOne(Model model, int boardseq) {
		
		model.addAttribute("dto", biz.selectOne(boardseq));
		
		return "noticeone";
	}
	
	@RequestMapping("/insertform.do")
	public String insertForm() {
		return "noticeinsert";
	}
	
	@RequestMapping("/insertres.do")
	public String insertRes(NoticeDto dto) {
		
		if (biz.insert(dto) > 0) {
			return "redirect:noticelist.do";
		}
		
		return "redirect:insertform.do";
	}
	
	@RequestMapping("/updateform.do")
	public String updateForm(Model model, int boardseq) {
		
		model.addAttribute("dto", biz.selectOne(boardseq));
		
		return "noticeupdate";
	}
	
	@RequestMapping("/updateres.do")
	public String updateRes(NoticeDto dto) {
		
		if (biz.update(dto) > 0) {
			return "redirect:noticeone.do?boardseq=" + dto.getBoardseq();
		}
		
		return "redirect:updateform.do";
	}
	
	@RequestMapping("/delete.do")
	public String delete(Model model, int boardseq) {
		
		if (biz.delete(boardseq) > 0) {
			return "redirect:noticelist.do";
		}
		
		return "redirect:noticeone.do";
	}
	
}
