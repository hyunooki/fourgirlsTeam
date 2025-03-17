package com.exam.payment.mapper;

import java.util.List;

import com.exam.payment.vo.PaymentVO;

public interface PaymentMapper {
	
	//결제준비항목
	public List<PaymentVO> selectPayment(String id);
	//결제삭제
	public int deletePay(PaymentVO param);
	//결제갱신
	public int paymentUpdate(PaymentVO param);
	//다운로드 리스트 등록
	 public List<PaymentVO> downloadList(String id);
	 //다운로드횟수 체크
	 public int cntCheck(PaymentVO param);
	//다운로드횟수 체크
     public int cntUpdate(PaymentVO param);
}
