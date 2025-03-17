package com.exam.test.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.exam.common.Control;
import com.exam.test.vo.TestVo;

public class ProdInsertFormControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
				req.getRequestDispatcher("test/prodInsertForm.tiles").forward(req, resp);
	}

}
