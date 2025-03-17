package com.exam.qna.mapper;

import java.util.List;

import com.exam.qna.vo.QnaVO;
import com.exam.qna.vo.SearchVO;

public interface QnaMapper {
 
 public List<QnaVO> qnaList(SearchVO param);
 
 
 public int totalCnt(SearchVO param);
 
 public List<QnaVO> categoryList();
 
 public int qnaAdd(QnaVO param);
 
 public QnaVO qnaDetail(int qnaNo);
 
 public int qnaDelete(int qnaNo);
 
 public List<QnaVO> qnaReplyList(QnaVO param);

 public int replyTotalCnt(int param);
}
