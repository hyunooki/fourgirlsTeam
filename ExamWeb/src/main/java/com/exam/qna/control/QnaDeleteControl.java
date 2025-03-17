package com.exam.qna.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.exam.common.Control;
import com.exam.common.DataSource;
import com.exam.qna.mapper.QnaMapper;

public class QnaDeleteControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		SqlSession session = DataSource.getInstance().openSession(true);
		QnaMapper mapper = session.getMapper(QnaMapper.class);
		
		String qno = req.getParameter("qno");
		
		if(mapper.qnaDelete(Integer.parseInt(qno))>0) {
			 resp.getWriter().print("{\"retCode\" : \"OK\"}");
		}else{
			 resp.getWriter().print("{\"retCode\" : \"NG\"}");
		};
	}

}
