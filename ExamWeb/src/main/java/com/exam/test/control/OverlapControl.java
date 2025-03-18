package com.exam.test.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.exam.common.Control;
import com.exam.common.DataSource;
import com.exam.test.mapper.RegisterMapper;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class OverlapControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		resp.setContentType("text/json;charset=utf-8");
		req.setCharacterEncoding("utf-8");
		SqlSession sqlSession=DataSource.getInstance().openSession();
		RegisterMapper mapper=sqlSession.getMapper(RegisterMapper.class); 
		
		List<String> memberList=mapper.memberList(); 
		
		System.out.println(memberList);
		
		//
		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		String json = gson.toJson(memberList);
		System.out.println(json);
		// js 파일에 멤버리스트 목록보냄
		resp.getWriter().print(json); 
		
	}

}
