package com.exam.detail.control;

import java.io.IOException;import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.exam.common.Control;
import com.exam.common.DataSource;
import com.exam.payment.vo.PaymentVO;
import com.exam.product.mapper.ProductReviewMapper;
import com.exam.product.vo.ReplyVO;

public class ReplyAddControl implements Control{

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		SqlSession session = DataSource.getInstance().openSession(true);
		ProductReviewMapper mapper = session.getMapper(ProductReviewMapper.class);
		
		String revTitle = req.getParameter("revTitle");
		String starPoint = req.getParameter("starPoint");
		String revContent = req.getParameter("revContent");
		String writer = (String)req.getSession().getAttribute("loginId");		
		String pno = req.getParameter("pno");
		
		ReplyVO prd= new ReplyVO();
		
		prd.setRevTitle(revTitle);
		prd.setStarPoint(Integer.parseInt(starPoint));
		prd.setRevContent(revContent);
		prd.setUserId(writer);
		prd.setProdNo(Integer.parseInt(pno));
		
		int prd2 = mapper.payOK(prd);
		
		req.setAttribute("prd", prd);
		
		if(prd2>0 && mapper.replyAdd(prd)>0) {
			resp.getWriter().print("{\"retCode\" : \"OK\"}");
		}else{
			resp.getWriter().print("{\"retCode\" : \"NG\"}");
		};
	}

}