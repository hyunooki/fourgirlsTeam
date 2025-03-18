package com.exam.mypage.control;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import com.exam.common.Control;
import com.exam.mypage.mapper.MypageMapper;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class SignoutControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/json;charset=utf-8");
		SqlSession sqlSession=com.exam.common.DataSource.getInstance().openSession(); 
		MypageMapper mapper=sqlSession.getMapper(MypageMapper.class);
		HttpSession session = req.getSession();
		String loginId=(String)session.getAttribute("loginId");
		
		int out=mapper.signout(loginId); 
		Map<String,Object> result=new HashMap<String, Object>(); 
		
		if(out>0) {
		  result.put("signOut", "OK");
		  result.put("retVal", loginId); 
		  sqlSession.commit(true);
		} else {
			result.put("signOut", "NG"); 
		}
		Gson gson=new GsonBuilder().create();
		String json=gson.toJson(result);
		resp.getWriter().print(json);
	}
}
