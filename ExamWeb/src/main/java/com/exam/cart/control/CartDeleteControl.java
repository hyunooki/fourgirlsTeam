package com.exam.cart.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import com.exam.cart.mapper.CartMapper;
import com.exam.cart.vo.CartVO;
import com.exam.common.Control;
import com.exam.common.DataSource;

public class CartDeleteControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String cartNo = req.getParameter("cartNo");

		SqlSession session = DataSource.getInstance().openSession(true);
		CartMapper mapper = session.getMapper(CartMapper.class);

		HttpSession session1 = req.getSession();
		String sessionId = (String) session1.getAttribute("loginId");

		CartVO param = new CartVO();
		param.setCartNo(Integer.parseInt(cartNo));
		param.setUserId(sessionId);
        
		
		if (mapper.cartDelete(param) > 0) {
			resp.getWriter().print("{\"retCode\" : \"OK\"}");
		  }
		else {
			resp.getWriter().print("{\"retCode\" : \"NG\"}");
			};

	}

}
