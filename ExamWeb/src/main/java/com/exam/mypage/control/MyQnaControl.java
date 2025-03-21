package com.exam.mypage.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import com.exam.common.Control;
import com.exam.mypage.mapper.MypageMapper;
import com.exam.qna.vo.QnaVO;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class MyQnaControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method s
		resp.setContentType("text/json;charset=utf-8");
		SqlSession sqlSession=com.exam.common.DataSource.getInstance().openSession(); 
		MypageMapper mapper=sqlSession.getMapper(MypageMapper.class);
		
		HttpSession session = req.getSession();
		String loginId=(String)session.getAttribute("loginId");
		
		List<QnaVO> myqna=mapper.userqna(loginId); 
		
		Gson gson=new GsonBuilder().setPrettyPrinting().create();
		String json=gson.toJson(myqna); 
		resp.getWriter().print(json);
	}

}
