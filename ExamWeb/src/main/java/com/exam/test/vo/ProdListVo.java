package com.exam.test.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ProdListVo {
	private int prodNo;
	private String prodName;
	private int price;
	private String content;
	private Date createDate;
	private String image;
	private String pdf;
	private int count;
	private String userId;
	private String categoryNo;
	private String asc;
	private String priceAsc;
	private int page;
	
}
