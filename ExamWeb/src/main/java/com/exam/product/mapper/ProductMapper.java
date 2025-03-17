package com.exam.product.mapper;

import org.apache.ibatis.annotations.Param;

import com.exam.product.vo.ProductVO;

public interface ProductMapper {
   
	public ProductVO productDetail(int prod);
	public int updateCount(int prod);
}
