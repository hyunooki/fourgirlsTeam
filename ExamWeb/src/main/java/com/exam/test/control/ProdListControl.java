package com.exam.test.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.exam.common.Control;
import com.exam.common.DataSource;
import com.exam.test.mapper.ProdListMapper;
import com.exam.test.vo.ProdListVo;


public class ProdListControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		SqlSession session = DataSource.getInstance().openSession(true);
		ProdListMapper mapper = session.getMapper(ProdListMapper.class);
		
		
		ProdListVo list =new ProdListVo();
		 List<ProdListVo> ProdList = mapper.ProdList(list);
		 
		 for(ProdListVo test : ProdList) {
			 System.out.println(test.getProdName());
		 }
		 
		 req.setAttribute("ProdList", ProdList);
		 
		 req.getRequestDispatcher("test/prodList.tiles").forward(req, resp);
		
	}

}
