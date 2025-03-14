package com.exam.test.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.exam.common.Control;

public class registerControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//회원가입 
		req.getRequestDispatcher("/WEB-INF/views/eun/register.jsp").forward(req, resp);

	}

}
