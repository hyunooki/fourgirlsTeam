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

public class QnaDetailForm implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		SqlSession session = DataSource.getInstance().openSession(true);
		QnaMapper mapper = session.getMapper(QnaMapper.class);
		
		int qno = Integer.parseInt(req.getParameter("qno"));
		mapper.cntUpdate(qno);
		
		QnaVO qna = mapper.qnaDetail(qno);
		
		
		req.setAttribute("qna", qna);
		
		req.getRequestDispatcher("qna/qnaDetail.tiles").forward(req, resp);
	}
}
