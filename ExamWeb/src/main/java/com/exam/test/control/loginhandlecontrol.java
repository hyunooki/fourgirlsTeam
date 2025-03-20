package com.exam.test.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.apache.ibatis.session.SqlSession;

import com.exam.cart.mapper.CartMapper;
import com.exam.cart.vo.CartVO;
import com.exam.common.Control;
import com.exam.mypage.mapper.MypageMapper;
import com.exam.test.mapper.TestMapper;
import com.exam.test.vo.MemberVo;

public class loginhandlecontrol implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		if (req.getMethod().equals("POST")) {
			// 2.로그인기능
			String id = req.getParameter("uname");
			String pw = req.getParameter("psw");
			// 로그인체크
			SqlSession sqlSession = com.exam.common.DataSource.getInstance().openSession();
			TestMapper mapper = sqlSession.getMapper(TestMapper.class);
			MypageMapper mymapper = sqlSession.getMapper(MypageMapper.class);

			// cartVO
			SqlSession sqlSession1 = com.exam.common.DataSource.getInstance().openSession();
			CartMapper mapper1 = sqlSession1.getMapper(CartMapper.class);

			int cartCount = mapper1.cartCount(id);

			// MemberDAO mdao = new MemberDAO();
			// 맴버객체 반환
			// 여기까지 잘받아아옴
			System.out.printf("아이디:" + id + "비밀번호:" + pw + "\n");
			MemberVo member = mapper.login(id, pw);
			// 세션에 userType지정하기
			HttpSession session = req.getSession();
			List<MemberVo> outmems = mymapper.outmembers();
			for (int i = 0; i < outmems.size(); i++) {
				System.out.println(outmems.get(i).getUserId());
				System.out.println(outmems.get(i).getPassword());	
				if (outmems.get(i).getUserId().equals(id) && outmems.get(i).getPassword().equals(pw) ) {
					
					System.out.println("탈퇴한회원과일치");
					session.setAttribute("outmems", "ok");
					break;
				} else {
					session.setAttribute("outmems", "no");
				}
			}

			if (member != null) {
				String userType = member.getUserType();
				// System.out.println("환영합니다" + mvo.getMemberName());
				// 세션 객체에 로그인 아이디를 저장
				session.setAttribute("loginId", id); // attribute활용 ->mvo의 id파라미터를 loginId에 받음
				session.setAttribute("userType", userType);
				session.setAttribute("cartCount", cartCount);
				// 일반사용자 or 관리자
				if (member.getUserType().equals("admin")) {

					resp.sendRedirect("main.do");

				} else {
					resp.sendRedirect("main.do");
				}
			} else {
				req.setAttribute("result", "No");
				System.out.println("id,pw 확인");
				System.out.println("아이디비번틀림");
				// req.getRequestDispatcher("eun/login.tiles").forward(req, resp);
				req.getRequestDispatcher("/WEB-INF/views/eun/login1.jsp").forward(req, resp);
			}
		}
	}
}
