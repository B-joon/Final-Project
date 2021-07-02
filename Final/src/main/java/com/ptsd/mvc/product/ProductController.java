package com.ptsd.mvc.product;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class ProductController {

	private static final String FILE_PATH = "resources/image/";
	
	@Autowired
	private ProductBiz biz;
	
	@RequestMapping("/productinsert.do")
	public String product() {
		
		return "productinsert";
	}
	
	@RequestMapping(value = "/productinsertres.do", method=RequestMethod.POST)
	public String productInsert(@RequestParam("img")MultipartFile file, ProductDto dto, Model model, HttpServletRequest request) throws IllegalStateException, IOException {
		
		System.out.println(request.getContextPath());
		System.out.println(request.getServletPath());
		System.out.println(request.getSession().getServletContext().getContextPath());

		String path = request.getSession().getServletContext().getRealPath("/resources/image/");
		System.out.println(path);
		String fileName = file.getOriginalFilename();
		dto.setThumbimg(FILE_PATH+fileName);
		dto.setAreacode(getAreacode(dto.getAddress()));

		if(!file.getOriginalFilename().isEmpty()) {
			file.transferTo(new File(path, fileName));
		} else {
			model.addAttribute("msg", "유효하지 않은 파일입니다.");
			return "productinsert";
		}
		
		int res = biz.insert(dto);
		
		if (res > 0) {
			return "redirect:/";
		} else {
			return "productinsert";
		}

	}
	
	@RequestMapping("getProductList.do")
	@ResponseBody
	public List<ProductDto> getProductList(int areacode) {
		
		List<ProductDto> list = biz.selectAreaList(areacode);
		
		return list;
	}
	
	@RequestMapping("productupdate.do")
	public String productUpdateForm(Model model, int productseq) {
		
		model.addAttribute("dto", biz.selectOne(productseq));
		
		return "productupdate";
	}
	
	@RequestMapping(value="productupdateres.do", method=RequestMethod.POST)
	public String productUpdateRes(@RequestParam("img")MultipartFile file, ProductDto dto, Model model, HttpServletRequest request) throws IllegalStateException, IOException {
		
		String path = request.getSession().getServletContext().getRealPath("/resources/image/");
		System.out.println(path);
		String fileName = file.getOriginalFilename();
		
		dto.setAreacode(getAreacode(dto.getAddress()));

//		if(!file.getOriginalFilename().isEmpty()) {
//			file.transferTo(new File(path, fileName));
//			dto.setThumbimg(FILE_PATH+fileName);
//		} else {
//			model.addAttribute("msg", "유효하지 않은 파일입니다.");
//			return "redirect:productupdate.do?productseq="+dto.getProductseq();
//		}
		
		int res = biz.update(dto);
		
		if (res > 0) {
			return "redirect:admin.do";
		} else {
			return "redirect:productupdate.do?productseq="+dto.getProductseq();
		}

	}
	
	@RequestMapping("productdelete.do")
	public String productDelete(int productseq) {
		
		int res = biz.delete(productseq);
		
		if (res > 0) {
			return "redirect:admin.do";
		} else {
			return "redirect:admin.do";
		}
		
		
	}
	
	private int getAreacode(String addr) {
		
		String temp = addr.substring(0, 2);
		int res = 0;
		System.out.println(temp);
		
		switch (temp) {
		case "서울":
			res = 1;
			break;
		case "경기":
			res = 31;
			break;
		case "인천":
			res = 2;
			break;
		case "충남":
			res = 34;
			break;
		case "충북":
			res = 33;
			break;
		case "대전":
			res = 3;
			break;
		case "세종":
			res = 8;
			break;
		case "강원":
			res = 32;
			break;
		case "전남":
			res = 38;
			break;
		case "전북":
			res = 37;
			break;
		case "광주":
			res = 5;
			break;
		case "울산":
			res = 7;
			break;
		case "대구":
			res = 4;
			break;
		case "경남":
			res = 36;
			break;
		case "경북":
			res = 35;
			break;
		case "부산":
			res = 6;
			break;
		case "제주":
			res = 39;
			break;
		default:
			break;
		}
		
		return res;
	}
	
}
