package com.exam.mypage.mapper;

import java.util.List;

import com.exam.cart.vo.CartVO;
import com.exam.payment.vo.PaymentVO;
import com.exam.qna.vo.QnaVO;

public interface MypageMapper {
	
	public List<QnaVO> userqna(String loginId); 
    public List<CartVO> mypagecarts(String loginId);
	public List<PaymentVO> mypagepayment(String loginId); 
}
