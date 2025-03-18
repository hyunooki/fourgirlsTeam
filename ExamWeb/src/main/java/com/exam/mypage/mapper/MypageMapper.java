package com.exam.mypage.mapper;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.exam.cart.vo.CartVO;
import com.exam.idpw.vo.IdpwVO;
import com.exam.payment.vo.PaymentVO;
import com.exam.qna.vo.QnaVO;

public interface MypageMapper {
	
	public List<QnaVO> userqna(String loginId); 
    public List<CartVO> mypagecarts(String loginId);
	public List<PaymentVO> mypagepayment(String loginId); 
	public int signout(String loginId);
	public IdpwVO searchid(@Param("name") String name
			              ,@Param("email") String email
			              , @Param("birth") Date birth);
}
