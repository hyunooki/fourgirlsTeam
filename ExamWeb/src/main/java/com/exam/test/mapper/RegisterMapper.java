package com.exam.test.mapper;

import java.util.List;

import com.exam.test.vo.MemberVo;

public interface RegisterMapper {
	public int insertMember(MemberVo member);
	public List<String> memberList(); //멤버 id 조회
	
}
