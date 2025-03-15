package com.exam.cart.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import com.exam.cart.mapper.CartMapper;
import com.exam.cart.vo.CartVO;
import com.exam.common.Control;
import com.exam.common.DataSource;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class CartFormControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		SqlSession session = DataSource.getInstance().openSession(true);
		CartMapper mapper = session.getMapper(CartMapper.class);
		
		resp.setContentType("text/json;charset=utf-8");
		HttpSession session1 = req.getSession(); 
		 String sessionId = (String)session1.getAttribute("loginId");
		 
		 List<CartVO> result = mapper.cartList(sessionId);
		 
		 Gson gson = new GsonBuilder().create();
		 String json = gson.toJson(result);
		 resp.getWriter().print(json);
	}

}
