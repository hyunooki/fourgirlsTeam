package com.exam.qna.vo;


import lombok.Data;

@Data
public class PageVO {
	private int startPage; //첫페이지.
	private int endPage;
	private int currentPage;
	private boolean prev;
	private boolean next;
	
	//생성자.
		public PageVO(int page, int totalCnt) {
			currentPage= page;
			endPage = (int) Math.ceil(currentPage/10.0)*10;
			startPage = endPage - 9; //계산상의 start, end
			
			int realEnd = (int) Math.ceil(totalCnt/5.0); //실제 마지막 페이지
			endPage = endPage > realEnd ? realEnd : endPage;
			
			prev = startPage == 1 ? false : true;
			next = endPage == realEnd ? false: true;
		}
}
