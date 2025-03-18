package com.exam.detail.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.exam.common.Control;
import com.exam.common.DataSource;
import com.exam.product.mapper.ProductReviewMapper;


public class ReplyPageContol implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String pno = req.getParameter("pno");
		
		SqlSession session = DataSource.getInstance().openSession(true);
		ProductReviewMapper mapper = session.getMapper(ProductReviewMapper.class);
		
		int totalCnt = mapper.replyTotalCnt(Integer.parseInt(pno));
		resp.getWriter().print("{\"totalCnt\" :"+totalCnt+"}");

	}

}
