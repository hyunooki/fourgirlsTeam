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
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class QnaReplyListForm implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("utf-8");
		 resp.setContentType("text/json;charset=utf-8");
		String rno = req.getParameter("qno");
		String page = req.getParameter("page");
		System.out.println("qno"+rno);
	    QnaVO param = new QnaVO();
	    param.setQnaNo(Integer.parseInt(rno));
	    param.setPage(Integer.parseInt(page));
	    
	    SqlSession session = DataSource.getInstance().openSession(true);
		QnaMapper mapper = session.getMapper(QnaMapper.class);
		
		List<QnaVO> list = mapper.qnaReplyList(param);
	
		
		Gson gson = new GsonBuilder().create();
		String json = gson.toJson(list);
		resp.getWriter().print(json);
	}

}
