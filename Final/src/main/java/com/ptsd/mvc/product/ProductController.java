package com.ptsd.mvc.product;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;

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
	
	@RequestMapping("getProductAllList.do")
	@ResponseBody
	public List<ProductDto> getProductAllList() {
		
		List<ProductDto> list = biz.selectAllList();
		
		return list;
	}
	
	@RequestMapping("productupdate.do")
	public String productUpdateForm(Model model, int productseq) {
		
		model.addAttribute("dto", biz.selectOne(productseq));
		
		return "productupdate";
	}
	
	@RequestMapping(value="productupdateres.do", method=RequestMethod.POST)
	public String productUpdateRes(@RequestParam("img")MultipartFile file, ProductDto dto, Model model, HttpServletRequest request) throws IllegalStateException, IOException {
		
		if (!file.isEmpty()) {
			
			String path = request.getSession().getServletContext().getRealPath("/resources/image/");
			System.out.println(path);
			String fileName = file.getOriginalFilename();
			
			dto.setAreacode(getAreacode(dto.getAddress()));
			
			String pastImgUrl = biz.selectOne(dto.getProductseq()).getThumbimg();
			pastImgUrl = request.getSession().getServletContext().getRealPath("") + pastImgUrl;

			System.out.println("삭제할 경로 : " + pastImgUrl);
			if(!file.getOriginalFilename().isEmpty()) {
				new File(pastImgUrl).delete();
				file.transferTo(new File(path, fileName));
				dto.setThumbimg(FILE_PATH+fileName);
			} else {
				model.addAttribute("msg", "유효하지 않은 파일입니다.");
				return "redirect:productupdate.do?productseq="+dto.getProductseq();
			}
			
		} else {
			dto.setAreacode(getAreacode(dto.getAddress()));
			String pastImgUrl = biz.selectOne(dto.getProductseq()).getThumbimg();
			dto.setThumbimg(pastImgUrl);
		}
		
		
		
		int res = biz.update(dto);
		
		if (res > 0) {
			return "redirect:admin.do";
		} else {
			return "redirect:productupdate.do?productseq="+dto.getProductseq();
		}

	}
	
	@RequestMapping(value="fileupload.do", method=RequestMethod.POST, produces = "application/json; charset=utf8")
	public String fileUpload(HttpServletRequest request, @RequestParam("file")MultipartFile file) throws IllegalStateException, IOException {
		
		JsonObject jsonObject = new JsonObject();
		
		String path = request.getSession().getServletContext().getRealPath("/resources/image/");
		System.out.println(path);
		String fileName = file.getOriginalFilename();

		File targetFile = new File(path + fileName);
		
		try {
			InputStream fileStream = file.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
			jsonObject.addProperty("url", "/resources/image/"+fileName); // contextroot + resources + 저장할 내부 폴더명
			jsonObject.addProperty("responseCode", "success");
				
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		
		String a = jsonObject.toString();
		return a;

	}
	
	
	@RequestMapping("productdelete.do")
	public String productDelete(HttpServletRequest request, int productseq) {

		System.out.println("productseq : " + productseq);
		
		String pastImgUrl = biz.selectOne(productseq).getThumbimg();
		pastImgUrl = request.getSession().getServletContext().getRealPath("") + pastImgUrl;
		boolean fileDelete = new File(pastImgUrl).delete();
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
