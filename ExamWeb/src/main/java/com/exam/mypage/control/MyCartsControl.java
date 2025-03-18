package com.exam.mypage.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import com.exam.cart.vo.CartVO;
import com.exam.common.Control;
import com.exam.mypage.mapper.MypageMapper;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class MyCartsControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/json;charset=utf-8");
		SqlSession sqlSession=com.exam.common.DataSource.getInstance().openSession(); 
		MypageMapper mapper=sqlSession.getMapper(MypageMapper.class);
		
		HttpSession session = req.getSession();
		String loginId=(String)session.getAttribute("loginId");
		
		List<CartVO>mypagecarts=mapper.mypagecarts(loginId);
		Gson gson=new GsonBuilder().setPrettyPrinting().create();
		String json=gson.toJson(mypagecarts); 
		resp.getWriter().print(json);
		
	}

}
