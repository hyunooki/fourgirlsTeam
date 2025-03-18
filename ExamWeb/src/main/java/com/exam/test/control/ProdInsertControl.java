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
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ProdInsertControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 2종류의 파일타입(multipart)
		String saveDir = req.getServletContext().getRealPath("images");
		MultipartRequest mr = new MultipartRequest(
			req // 1.요청객체
			,saveDir // 2.파일저장경로
			,1024*1024*5 // 3.최대파일크기
			, "utf-8"// 4.인코딩
			,new DefaultFileRenamePolicy() // 5.리네임정책
			);
		
		
		/* resp.setContentType("text/html;charset=utf-8"); */
		req.setCharacterEncoding("utf8");
		String prodName = mr.getParameter("prodName");
		String content = mr.getParameter("content");
		String userId = mr.getParameter("userId");
		int price = Integer.parseInt(mr.getParameter("price"));
		int page = Integer.parseInt(mr.getParameter("page"));
		String image = mr.getFilesystemName("image");
		
		
		ProdListVo prod = new ProdListVo();
		prod.setProdName(prodName);
		prod.setContent(content);
		prod.setUserId(userId);
		prod.setPrice(price);
		prod.setPage(page);
		prod.setImage(image);
		
		System.out.println(prodName);
		System.out.println(content);
		System.out.println(userId);
		System.out.println(price);
		System.out.println(page);
		System.out.println(image);
		SqlSession sqlsession = DataSource.getInstance().openSession(true); 
		ProdListMapper mapper = sqlsession.getMapper(ProdListMapper.class);
		
		
		mapper.ProdInsert(prod);
		req.setAttribute("prod", prod); 
		
		
		resp.sendRedirect("prodList.do"); 
		
		
		
	}

}
