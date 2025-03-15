package com.exam.payment.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import com.exam.common.Control;
import com.exam.common.DataSource;
import com.exam.payment.mapper.PaymentMapper;
import com.exam.payment.vo.PaymentVO;

public class PaymentsForm implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		 HttpSession session1 = req.getSession(); 
		 String sessionId = (String)session1.getAttribute("loginId");
		 
		
		// TODO Auto-generated method stub
		SqlSession session = DataSource.getInstance().openSession(true);
		PaymentMapper mapper = session.getMapper(PaymentMapper.class);
		
		List<PaymentVO> result = mapper.selectPayment(sessionId);
		req.setAttribute("list", result);
		
		req.getRequestDispatcher("payments/payments.tiles").forward(req, resp);
	}
}
