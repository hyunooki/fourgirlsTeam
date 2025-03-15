package com.exam.cart.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import com.exam.cart.mapper.CartMapper;
import com.exam.common.Control;
import com.exam.common.DataSource;
import com.exam.payment.vo.PaymentVO;

public class CartToPaymentInsert implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		SqlSession session = DataSource.getInstance().openSession(true);
		CartMapper mapper = session.getMapper(CartMapper.class);
		
		HttpSession session1 = req.getSession(); 
		 String sessionId = (String)session1.getAttribute("loginId");
		
		 String payNo = req.getParameter("payNo");
		 String prodNo = req.getParameter("prodNo");
		 
		 PaymentVO param = new PaymentVO();
		 
		 param.setPayNo(Integer.parseInt(payNo));
		 param.setUserId(sessionId);
		 param.setProdNo(Integer.parseInt(prodNo));
		 
		 if(mapper.cartInto(param)>0) {
			 resp.getWriter().print("{\"retCode\" : \"OK\"}");
		 }else{
			 resp.getWriter().print("{\"retCode\" : \"NG\"}");
		 };
		 
	}

}
