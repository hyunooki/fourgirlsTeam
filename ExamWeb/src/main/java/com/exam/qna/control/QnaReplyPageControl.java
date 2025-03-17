package com.exam.qna.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.exam.common.Control;
import com.exam.common.DataSource;
import com.exam.qna.mapper.QnaMapper;

public class QnaReplyPageControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String qno = req.getParameter("qno");
		
		
		SqlSession session = DataSource.getInstance().openSession(true);
		QnaMapper mapper = session.getMapper(QnaMapper.class);
		
		int totalCnt = mapper.replyTotalCnt(Integer.parseInt(qno));
		resp.getWriter().print("{\"totalCnt\" :"+totalCnt+"}");
	}

}
