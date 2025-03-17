package com.exam.test.vo;

import java.util.Date;

import lombok.Data;
@Data
public class MemberVo {	
	String userId; 
	String userName; 
	String phone; 
	String email;
	Date birth; 
	String password; 
	String userType; 
	String outType;	
}
