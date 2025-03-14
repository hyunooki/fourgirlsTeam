package com.exam.test.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.exam.common.Control;
import com.exam.common.DataSource;
import com.exam.test.mapper.TestMapper;
import com.exam.test.vo.TestVo;

public class TestControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("실행됨");
		
		SqlSession session = DataSource.getInstance().openSession(true);
		TestMapper mapper = session.getMapper(TestMapper.class);
		
		 List<TestVo> testList = mapper.testList();
		 
		 for(TestVo test : testList) {
			 System.out.println(test.getProdName());
		 }
		 
		 req.setAttribute("test", testList);
		 
		 req.getRequestDispatcher("test/test.tiles").forward(req, resp);
		 
		 
	}

}
