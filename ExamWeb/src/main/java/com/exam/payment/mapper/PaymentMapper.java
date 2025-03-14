package com.exam.payment.mapper;

import java.util.List;

import com.exam.payment.vo.PaymentVO;

public interface PaymentMapper {
	public List<PaymentVO> selectPayment(String id);
}
