package com.exam.admin.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.exam.common.Control;

public class AdminMainControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//관리자페이지 따로만들기 
		req.getRequestDispatcher("admin/adminMain.tiles").forward(req, resp); 
	}

}
