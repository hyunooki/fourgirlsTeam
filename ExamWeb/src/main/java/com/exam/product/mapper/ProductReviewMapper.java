package com.exam.product.mapper;

import java.util.List;

import com.exam.product.vo.ReplyVO;

public interface ProductReviewMapper {

	public List<ReplyVO> productReply(ReplyVO param);

	public int replyTotalCnt(int param);
	
	public int replyAdd(ReplyVO param);
}
