package com.exam.admin.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.exam.admin.mapper.AdminMapper;
import com.exam.common.Control;
import com.exam.common.DataSource;

public class AdminMainControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//관리자페이지 따로만들기 
		SqlSession session = DataSource.getInstance().openSession(true);
        AdminMapper mapper = session.getMapper(AdminMapper.class);
        
        int todayMake = mapper.todayMake();
        int todayRelease = mapper.todayRelease();
        int totalMember = mapper.totalMember();
        int todayStore = mapper.todayStore();
        
        req.setAttribute("todayMake", todayMake);
        req.setAttribute("todayRelease", todayRelease);
        req.setAttribute("totalMember", totalMember);
        req.setAttribute("todayStore", todayStore);
        
		
		req.getRequestDispatcher("admin/adminMain.tiles").forward(req, resp); 
	}

}
