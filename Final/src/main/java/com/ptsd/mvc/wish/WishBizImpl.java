package com.ptsd.mvc.wish;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ptsd.mvc.product.ProductDto;

@Service
public class WishBizImpl implements WishBiz {

	@Autowired
	private WishDao dao;

	@Override
	public List<ProductDto> listWish(int wishuserseq) {
		// TODO Auto-generated method stub
		return dao.listWish(wishuserseq);
	}

	@Override
	public int addWish(WishDto dto) {
		// TODO Auto-generated method stub
		return dao.addWish(dto);
	}

	@Override
	public int delWish(int wishuserseq) {
		// TODO Auto-generated method stub
		return dao.delWish(wishuserseq);
	}

	@Override
	public int wishChk(WishDto dto) {
		// TODO Auto-generated method stub
		return dao.wishChk(dto);
	}
	


}
