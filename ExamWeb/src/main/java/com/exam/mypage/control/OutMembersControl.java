package com.exam.mypage.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.exam.common.Control;
import com.exam.common.DataSource;
import com.exam.mypage.mapper.MypageMapper;
import com.exam.test.vo.MemberVo;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class OutMembersControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/json;charset=utf-8");
		//탈퇴회원 전체 받아오기 
		SqlSession sqlSession = DataSource.getInstance().openSession();
		MypageMapper mapper = sqlSession.getMapper(MypageMapper.class);
		
		List<MemberVo> outmembers=mapper.outmembers(); //탈퇴한 회원리스트를 받아옴
		
		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		String json = gson.toJson(outmembers);
        resp.getWriter().print(json);		
		
	}

}
