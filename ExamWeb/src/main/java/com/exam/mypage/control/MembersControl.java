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

public class MembersControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/json;charset=utf-8");
		// 멤버객체를 모두 받아오기
		SqlSession sqlSession = DataSource.getInstance().openSession();
		MypageMapper mapper = sqlSession.getMapper(MypageMapper.class);

		List<MemberVo> members = mapper.members();
		System.out.println(members);

		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		String json = gson.toJson(members);
		System.out.println(json);
		resp.getWriter().print(json);
		

	}

}
