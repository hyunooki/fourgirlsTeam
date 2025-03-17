package com.exam.qna.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.exam.common.Control;
import com.exam.common.DataSource;
import com.exam.qna.mapper.QnaMapper;
import com.exam.qna.vo.QnaVO;

public class QnaAddFormControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		SqlSession session = DataSource.getInstance().openSession(true);
		QnaMapper mapper = session.getMapper(QnaMapper.class);
		
		List<QnaVO> list = mapper.categoryList();
		
		req.setAttribute("list", list);
		
		
		req.getRequestDispatcher("qna/qnaAdd.tiles").forward(req, resp);
		

	}

}
