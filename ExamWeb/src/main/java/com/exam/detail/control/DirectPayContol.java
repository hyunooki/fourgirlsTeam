package com.exam.detail.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.exam.common.Control;
import com.exam.common.DataSource;
import com.exam.payment.vo.PaymentVO;
import com.exam.product.mapper.ProductReviewMapper;

public class DirectPayContol implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		SqlSession session = DataSource.getInstance().openSession(true);
		ProductReviewMapper mapper = session.getMapper(ProductReviewMapper.class);
		
		String user = (String)req.getSession().getAttribute("loginId");
		int pno = Integer.parseInt(req.getParameter("pno"));
		
		
		PaymentVO pay = new PaymentVO();
		pay.setUserId(user);
		pay.setProdNo(pno);
		
		if(mapper.directPay(pay)>0) {
			resp.getWriter().print("{\"retCode\" : \"OK\"}");
		}else{
			resp.getWriter().print("{\"retCode\" : \"NG\"}");
		};
		
	}

}
