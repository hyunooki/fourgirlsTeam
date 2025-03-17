package com.exam.payment.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class PaymentVO {
	private int payNo;
	private int price;
	private int prodNo;
	private String prodName;
	private Date payDate;
	private String userId;
	private String pdf;
	private String categoryName;
	private int downCnt;
}
