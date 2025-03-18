package com.exam.admin.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.exam.admin.mapper.AdminMapper;
import com.exam.common.Control;
import com.exam.common.DataSource;

public class DeleteDate implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		SqlSessionFactory sqlSessionFactory = DataSource.getInstance();
		SqlSession session = sqlSessionFactory.openSession(true);
		AdminMapper mapper = session.getMapper(AdminMapper.class);
		String title = req.getParameter("title");
		String start = req.getParameter("start");
		String end = req.getParameter("end");
		end=end==null?"":end;
		
		
		
		if(mapper.deleteEvent(title,start,end)>0) {
			resp.getWriter().print("{\"retCode\" : \"OK\"}");
		}else{
			resp.getWriter().print("{\"retCode\" : \"NG\"}");
		};
	}

}
