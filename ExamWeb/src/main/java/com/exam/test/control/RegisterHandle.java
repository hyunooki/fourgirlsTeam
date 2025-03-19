package com.exam.test.control;

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
			
			System.out.println("회원가입 컨트롤러 실행중....");
			
			req.setCharacterEncoding("utf-8");
			resp.setContentType("text/json;charset=utf-8");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String id = req.getParameter("id");
			String password = req.getParameter("password");
			String phone = req.getParameter("phone");
			String name = req.getParameter("username");
			String email = req.getParameter("email");
			String stringbirth = req.getParameter("birth"); // 2000-08-08 이런식임

			Date birth = null;

			try {
				birth = sdf.parse(stringbirth);
				System.out.println("변환된 생년월일" + birth);
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
			// 회원가입시 기본 userType을 user라고 설정...
			member.setUserType("user");
			member.setOutType("no");

			System.out.println("회원가입 정보확인" + member.getEmail() + member.getOutType() + member.getPassword()
					+ member.getPhone() + member.getUserId() + member.getUserName() + member.getUserType());

			SqlSession sqlSession = com.exam.common.DataSource.getInstance().openSession(true);
			RegisterMapper mapper = sqlSession.getMapper(RegisterMapper.class);
			// checkOverlap > 0 -> 회원가입 경고문 떠야됨
			HttpSession session = req.getSession();

			int checkOverlap = mapper.checkOverlap(id);

			if (checkOverlap == 0) {

				if (mapper.insertMember(member) > 0) {

					resp.sendRedirect("main.do");
				} else {
					System.out.println("회원가입실패");
				}
			} else if (checkOverlap > 0) {
				session.setAttribute("checkOverlap", checkOverlap);
				req.getRequestDispatcher("eun/register2.tiles").forward(req, resp);
				System.out.println("중복된 아이디가 있음 ");
			}

		}

	}

}
