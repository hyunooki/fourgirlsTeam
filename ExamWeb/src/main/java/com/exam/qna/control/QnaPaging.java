package com.exam.qna.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.exam.common.Control;
import com.exam.common.DataSource;
import com.exam.qna.mapper.QnaMapper;
import com.exam.qna.vo.SearchVO;

public class QnaPaging implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String category = req.getParameter("category");
		String searchCondition= req.getParameter("search");
		String keyword= req.getParameter("keyword");
		
		
		SqlSession session = DataSource.getInstance().openSession(true);
		QnaMapper mapper = session.getMapper(QnaMapper.class);
		
		SearchVO svo = new SearchVO();
		svo.setCategory(category);
		svo.setSearchCondition(searchCondition);
		svo.setKeyword(keyword);
		
		int totalCnt =mapper.totalCnt(svo);
		
		resp.getWriter().print("{\"totalCnt\" :"+totalCnt+"}");
		
	}

}
