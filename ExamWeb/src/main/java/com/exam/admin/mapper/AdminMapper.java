package com.exam.admin.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface AdminMapper {
	//캘린더
	public List<Map<String,Object>> fullData();
	//등록
	public int insertEvent(@Param("title") String title,
			  @Param("start") String start,
			  @Param("end") String end);
	//삭제
	public int deleteEvent(@Param("title") String title,
				@Param("start") String start,
				@Param("end") String end);
}
