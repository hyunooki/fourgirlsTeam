package com.exam.qna.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.exam.common.Control;
import com.exam.common.DataSource;
import com.exam.qna.mapper.QnaMapper;
import com.exam.qna.vo.QnaVO;

public class qnaAddControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String writer = req.getParameter("writer");
		String category = req.getParameter("category");
		
		QnaVO qna = new QnaVO();
		qna.setQnaTitle(title);
		qna.setQnaContent(content);
		qna.setUserId(writer);
		qna.setCategoryNo(category);
		
		SqlSession session = DataSource.getInstance().openSession(true);
		QnaMapper mapper = session.getMapper(QnaMapper.class);
		
		if(mapper.qnaAdd(qna)>0) {
		  resp.sendRedirect("qnaList.do");	
		};
		
	
	}

}
