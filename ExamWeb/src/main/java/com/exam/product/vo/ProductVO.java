package com.exam.product.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class ProductVO {
   private int prodNo;
   private String prodName;
   private int price;
   private String content;
   private Date createDate;
   private String image;
   private String pdf;
   private int count;
   private String userId;
   private int page;
   private String categoryNo;
   private int starPoint;
   
}
