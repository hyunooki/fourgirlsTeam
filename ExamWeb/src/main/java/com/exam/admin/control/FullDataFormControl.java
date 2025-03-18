package com.exam.admin.control;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.exam.admin.mapper.AdminMapper;
import com.exam.common.Control;
import com.exam.common.DataSource;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;



public class FullDataFormControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/json;charset=utf-8");
		SqlSession session = DataSource.getInstance().openSession(true);
          AdminMapper mapper = session.getMapper(AdminMapper.class);
			List<Map<String,Object>> list = mapper.fullData();
			Gson gson = new GsonBuilder().setPrettyPrinting().create();
			resp.getWriter().print(gson.toJson(list));	
	}

}
