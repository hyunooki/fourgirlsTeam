package com.exam.cart.vo;


import lombok.Data;

@Data
public class CartVO {
   private int cartNo;
   private String userId;
   private String prodNo;
   private String prodName;
   private int price;
   private String image;
}
