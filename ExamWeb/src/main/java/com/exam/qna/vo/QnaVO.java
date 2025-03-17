package com.exam.qna.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class QnaVO {
	private int qnaNo;
	private String qnaTitle;
	private String qnaContent;
	private Date qnaCreate;
	private int qnaCnt;
	private String userId;
	private String categoryName;
	private String categoryNo;
	private int qnaRevno;
    private Date qnaRevdate;
    private int page;
    

}
