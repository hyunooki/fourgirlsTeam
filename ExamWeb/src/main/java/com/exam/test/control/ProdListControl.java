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
		
		String name = req.getParameter("name");
		if(name == null) {
			name = "";
		}
		
		String asc = req.getParameter("asc");
		if(asc == null) {
			asc = "";
		}
		System.out.println();
		String priceAsc = req.getParameter("priceAsc");
		if(priceAsc == null) {
			priceAsc = "";
		}
		
		System.out.println("------------------------------");
		System.out.println(priceAsc);
		
		
	
		SqlSession session = DataSource.getInstance().openSession(true);
		ProdListMapper mapper = session.getMapper(ProdListMapper.class);
		
		
		ProdListVo item = new ProdListVo();
		
		item.setProdName(name);
		item.setAsc(asc);
		item.setPriceAsc(priceAsc);
		List<ProdListVo> prodList = mapper.ProdList(item);

		req.setAttribute("prodList", prodList);

		req.getRequestDispatcher("test/prodList.tiles").forward(req, resp);
		
	}

}
