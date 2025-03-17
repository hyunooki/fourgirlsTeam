package com.exam.test.control;

import java.io.IOException;
import java.lang.reflect.Member;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import com.exam.common.Control;
import com.exam.test.mapper.TestMapper;
import com.exam.test.vo.MemberVo;
import com.exam.test.vo.TestVo;


public class loginhandlecontrol implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		  if (req.getMethod().equals("POST")) {
				// 2.로그인기능
				String id = req.getParameter("uname"); 
				String pw = req.getParameter("psw");		
				// 로그인체크
				SqlSession sqlSession=com.exam.common.DataSource.getInstance().openSession(); 
				TestMapper mapper=sqlSession.getMapper(TestMapper.class); 
				
				
				//MemberDAO mdao = new MemberDAO();
				//맴버객체 반환 
				//여기까지 잘받아아옴 
				System.out.printf("아이디:"+id+"비밀번호:"+pw+"\n");
				MemberVo member = mapper.login(id,pw);
				//세션에 userType지정하기

				if (member != null) {
					String userType=member.getUserType(); 
					//System.out.println("환영합니다" + mvo.getMemberName());
					// 세션 객체에 로그인 아이디를 저장
					HttpSession session = req.getSession();
					session.setAttribute("loginId", id); // attribute활용 ->mvo의 id파라미터를 loginId에 받음
					session.setAttribute("userType",userType );
					//일반사용자 or 관리자 
					if(member.getUserType().equals("admin")) {
						
						resp.sendRedirect("main.do");
						
					}
				else {
					resp.sendRedirect("main.do");
					} 
				} else{
					req.setAttribute("result", "No");
					System.out.println("id,pw 확인");
					System.out.println("아이디비번틀림");
					req.getRequestDispatcher("eun/login.tiles").forward(req, resp);
				}
			}		
	}
}
