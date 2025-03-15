package com.exam.cart.mapper;

import java.util.List;

import com.exam.cart.vo.CartVO;
import com.exam.payment.vo.PaymentVO;

public interface CartMapper {
	//카트조회
	public List<CartVO>  cartList(String userId);
	//카트삭제
	public int cartDelete(CartVO param);
	//결제등록
	public int cartInto(PaymentVO param);
}
