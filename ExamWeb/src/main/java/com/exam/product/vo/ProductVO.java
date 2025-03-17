package com.exam.product.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ProductVO {
   private int prodNo;
   private String prodName;
   private int price;
   private String content;
   private Date createDate;
   private String img;
   private String pdf;
   private int count;
   private String userId;
   private int page;
   private String categoryNo;
}
