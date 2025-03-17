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
import com.exam.qna.vo.SearchVO;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class QnaListAjaxControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("utf-8");
		 resp.setContentType("text/json;charset=utf-8");
		String page = req.getParameter("page");
		String category = req.getParameter("category");
		String orderBy= req.getParameter("orderBy");
		String searchCondition= req.getParameter("search");
		String keyword= req.getParameter("keyword");
		
		page= page==null?"1":page;
		category=category==null?"":category;
		orderBy=orderBy==null?"":orderBy;
		searchCondition=searchCondition==null?"":searchCondition;
		keyword=keyword==null?"":keyword;
		
		
		
		SearchVO svo = new SearchVO(Integer.parseInt(page),category,orderBy,searchCondition,keyword);
		
		SqlSession session = DataSource.getInstance().openSession(true);
		QnaMapper mapper = session.getMapper(QnaMapper.class);
		
		List<QnaVO> qnaList = mapper.qnaList(svo);
		
		Gson gson = new GsonBuilder().create();
		String json = gson.toJson(qnaList);
		resp.getWriter().print(json);
	}

}
