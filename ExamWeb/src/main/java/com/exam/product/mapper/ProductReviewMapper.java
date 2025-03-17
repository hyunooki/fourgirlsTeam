package com.exam.product.mapper;

import java.util.List;

import com.exam.product.vo.ReplyVO;

public interface ProductReviewMapper {
	
	public List<ReplyVO> productReply(int prod);
}
