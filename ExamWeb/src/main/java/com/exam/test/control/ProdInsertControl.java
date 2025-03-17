package com.exam.test.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import com.exam.common.Control;
import com.exam.common.DataSource;
import com.exam.test.mapper.ProdListMapper;
import com.exam.test.vo.ProdListVo;
import com.exam.test.vo.TestVo;

public class ProdInsertControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		/* resp.setContentType("text/html;charset=utf-8"); */
		req.setCharacterEncoding("utf8");
		String prodName = req.getParameter("prodName");
		String content = req.getParameter("content");
		String userId = req.getParameter("userId");
		int price = Integer.parseInt(req.getParameter("price"));
		
		System.out.println(prodName);
		System.out.println(content);
		System.out.println(userId);
		System.out.println(price);
		
		ProdListVo prod = new ProdListVo();
		prod.setProdName(prodName);
		prod.setContent(content);
		prod.setUserId(userId);
		prod.setPrice(price);
		
		
		SqlSession sqlsession = DataSource.getInstance().openSession(true); 
		ProdListMapper mapper = sqlsession.getMapper(ProdListMapper.class);
		
		
		mapper.ProdInsert(prod);
		req.setAttribute("prod", prod); 
		
		
		resp.sendRedirect(req.getContextPath() + "test/prodList.tiles");
		
		
		
	}

}
