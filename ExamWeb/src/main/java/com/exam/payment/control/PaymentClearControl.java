package com.exam.payment.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.exam.common.Control;
import com.exam.common.DataSource;
import com.exam.payment.mapper.PaymentMapper;

public class PaymentClearControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		SqlSession session = DataSource.getInstance().openSession(true);
		PaymentMapper mapper = session.getMapper(PaymentMapper.class);
		
		int payNo = Integer.parseInt(req.getParameter("payNo"));
		
		if(mapper.paymentUpdate(payNo)>0) {
			resp.getWriter().print("{\"retCode\" : \"OK\"}");
		}else{
			resp.getWriter().print("{\"retCode\" : \"NG\"}");
		};
	}

}
