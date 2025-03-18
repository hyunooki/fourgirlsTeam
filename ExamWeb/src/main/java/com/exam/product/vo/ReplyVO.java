package com.exam.product.vo;

import java.sql.Date;
import lombok.Data;

@Data
public class ReplyVO {
	private int revNo;
	private int starPoint;
	private String revTitle;
	private Date revCreate;
	private String revContent;
	private String userId;
	private int payNo;
}
