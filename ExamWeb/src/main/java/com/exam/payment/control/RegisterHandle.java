package com.exam.payment.control;

import java.io.IOException;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import com.exam.common.Control;
import com.exam.test.mapper.RegisterMapper;
import com.exam.test.mapper.TestMapper;
import com.exam.test.vo.MemberVo;

public class RegisterHandle implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if (req.getMethod().equals("POST")) {
			//
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

			String id = req.getParameter("id");
			String password = req.getParameter("password");
			String phone = req.getParameter("phone");
			String name = req.getParameter("name");
			String email = req.getParameter("email");
			String stringbirth = req.getParameter("birth"); // 2000-08-08 이런식임

			Date birth = null;
			

			try {
				birth = sdf.parse(stringbirth);
				System.out.println(birth);
			} catch (ParseException e) {
				e.printStackTrace();
				System.out.println("회원가입 생년원일 날짜변환실패");
			}

			MemberVo member = new MemberVo();
			member.setUserId(id);
			member.setPassword(password);
			member.setPhone(phone);
			member.setUserName(name);
			member.setEmail(email);
			member.setBirth(birth);
			member.setUserType("user");
			member.setOutType("no");

			SqlSession sqlSession = com.exam.common.DataSource.getInstance().openSession();
			RegisterMapper mapper = sqlSession.getMapper(RegisterMapper.class);

			if (mapper.insertMember(member) > 0) {
				sqlSession.commit(true);
				resp.sendRedirect("main.do");
			} else {
				System.out.println("회원가입실패");
			}

		}

	}

}
