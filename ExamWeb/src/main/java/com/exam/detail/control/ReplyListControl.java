package com.exam.detail.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.exam.common.Control;
import com.exam.common.DataSource;
import com.exam.product.mapper.ProductReviewMapper;
import com.exam.product.vo.ReplyVO;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class ReplyListControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("실행됨");
		resp.setContentType("text/json;charset=utf-8");	

		String param = req.getParameter("pno");
		String page = req.getParameter("page");

		SqlSession session = DataSource.getInstance().openSession(true);
		ProductReviewMapper mapper = session.getMapper(ProductReviewMapper.class);
		
		List<ReplyVO> rply = mapper.productReply(Integer.parseInt(param));

		// gson활용.
		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		String json = gson.toJson(rply); // 자바객체 -> json문자열.

		System.out.println(json); // 콘솔.
		resp.getWriter().print(json); // 웹브라우저.
	}

}
