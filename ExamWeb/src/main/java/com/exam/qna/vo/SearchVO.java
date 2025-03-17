package com.exam.qna.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SearchVO {
	private int page;
	private String category;
	private String orderBy;
	private String searchCondition;
	private String keyword;
	
	
	public SearchVO(int page) {
		super();
		this.page = page;
	}

	
}


