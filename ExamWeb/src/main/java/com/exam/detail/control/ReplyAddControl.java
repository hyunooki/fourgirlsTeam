package com.exam.detail.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.exam.common.Control;
import com.exam.common.DataSource;
import com.exam.product.mapper.ProductReviewMapper;
import com.exam.product.vo.ReplyVO;

public class ReplyAddControl implements Control{

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		SqlSession session = DataSource.getInstance().openSession(true);
		ProductReviewMapper mapper = session.getMapper(ProductReviewMapper.class);
		
		String title = req.getParameter("title");
		String star = req.getParameter("star");
		String content = req.getParameter("content");
		String writer = req.getParameter("writer");
		
		ReplyVO prd= new ReplyVO();
		
		prd.setRevTitle(title);
		prd.setStarPoint(Integer.parseInt(star));
		prd.setRevContent(content);
		prd.setUserId(writer);
		
		if(mapper.replyAdd(prd)>0) {
			resp.getWriter().print("{\"retCode\" : \"OK\"}");
		}else{
			resp.getWriter().print("{\"retCode\" : \"NG\"}");
		};
	}

}