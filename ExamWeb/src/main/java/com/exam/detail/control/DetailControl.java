package com.exam.detail.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.exam.common.Control;
import com.exam.common.DataSource;
import com.exam.product.mapper.ProductMapper;
import com.exam.product.vo.ProductVO;

public class DetailControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("실행됨");

		
		SqlSession session = DataSource.getInstance().openSession(true);
		ProductMapper mapper = session.getMapper(ProductMapper.class);

		String param = req.getParameter("pno"); 
		
		
		ProductVO pro= mapper.productDetail(Integer.parseInt(param));
		mapper.updateCount(Integer.parseInt(param));
		
		
		
		System.out.println();

		req.setAttribute("product", pro);

		req.getRequestDispatcher("product/detail.tiles").forward(req, resp);

	}

}
