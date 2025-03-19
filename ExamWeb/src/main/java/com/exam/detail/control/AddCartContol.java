package com.exam.detail.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.exam.cart.vo.CartVO;
import com.exam.common.Control;
import com.exam.common.DataSource;
import com.exam.product.mapper.ProductReviewMapper;


public class AddCartContol implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		SqlSession session = DataSource.getInstance().openSession(true);
		ProductReviewMapper mapper = session.getMapper(ProductReviewMapper.class);
		
		String user = (String)req.getSession().getAttribute("loginId");		
		String pno = req.getParameter("pno");
		
		CartVO cart = new CartVO();
		cart.setUserId(user);
		cart.setProdNo(pno);
		if(mapper.addCart(cart)>0) {
			resp.getWriter().print("{\"retCode\" : \"OK\"}");
		}else{
			resp.getWriter().print("{\"retCode\" : \"NG\"}");
		};
	}

}
