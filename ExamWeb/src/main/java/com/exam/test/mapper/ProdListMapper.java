package com.exam.test.mapper;

import java.util.List;

import com.exam.test.vo.ProdListVo;

public interface ProdListMapper {
	public List<ProdListVo> ProdList(ProdListVo prodlist);
	public void ProdInsert(ProdListVo prod);
	public int totalPage(String page);
	
	
}
