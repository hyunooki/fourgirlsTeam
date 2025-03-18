package com.exam.mypage.control;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.exam.common.Control;
import com.exam.idpw.vo.IdpwVO;
import com.exam.mypage.mapper.MypageMapper;

public class SearchIdhandleControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if (req.getMethod().equals("POST")) {
			System.out.println("아이디찾기 컨트롤러 작동중....");
			req.setCharacterEncoding("utf-8");
			resp.setContentType("text/json;charset=utf-8");
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String name = req.getParameter("name");
			String email = req.getParameter("email");
			String stringbirth = req.getParameter("birth");
			Date birth = null;

			try {
				birth = sdf.parse(stringbirth);
				System.out.println("변환된 생년월일" + birth);
			} catch (ParseException e) {
				e.printStackTrace();
				System.out.println("아이디 찾기 날짜변환실패");
			}
			SqlSession sqlSession = com.exam.common.DataSource.getInstance().openSession(true);
			MypageMapper mapper = sqlSession.getMapper(MypageMapper.class);
			IdpwVO idpw = mapper.searchid(name, email, birth);
			if (idpw != null) {
				System.out.println("아이디 비번찾기 성공!" + idpw.getUserId() + idpw.getPassword());
			} else {
				System.out.println("아이디비번찾기 실패....ㅠㅠ");
			}

			
		}

	}

}
