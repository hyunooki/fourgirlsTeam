package com.exam.test.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import com.exam.common.Control;
import com.exam.common.DataSource;

import com.exam.test.mapper.TestMapper;
import com.exam.test.vo.MemberVo;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class MyInfoControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 마이페이지에서 멤버정보 불러오기
		resp.setContentType("text/json;charset=utf-8");
		SqlSession sqlSession=com.exam.common.DataSource.getInstance().openSession(); 
		TestMapper mapper=sqlSession.getMapper(TestMapper.class);
		
		HttpSession session = req.getSession();
		String loginId=(String)session.getAttribute("loginId");
		System.out.println("로그인id"+loginId);
		MemberVo member=mapper.mypageInfo(loginId); 
//		System.out.println("myinfo.do 실행정보"
//		                   +member.getEmail()
//						   +member.getOutType()
//						   +member.getPassword()
//						   +member.getPhone()
//						   +member.getPhone()
//						   +member.getUserId()
//						   +member.getUserName()
//						   +member.getUserType());
	Gson gson=new GsonBuilder().setPrettyPrinting().create();
	String json=gson.toJson(member);
	//멤버정보를 아작스로 하게함 
	resp.getWriter().print(json);
		

	}

}
