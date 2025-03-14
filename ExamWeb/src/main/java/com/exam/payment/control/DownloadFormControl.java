package com.exam.payment.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.exam.common.Control;
import com.exam.common.DataSource;
import com.exam.payment.mapper.PaymentMapper;
import com.exam.payment.vo.PaymentVO;

public class DownloadFormControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String id= "user01";
		
		SqlSession session = DataSource.getInstance().openSession(true);
		PaymentMapper mapper = session.getMapper(PaymentMapper.class);
	    
		List<PaymentVO> result =mapper.downloadList(id);
		req.setAttribute("list", result);
		
		req.getRequestDispatcher("payments/download.tiles").forward(req, resp);
		
	}

}
