package com.exam.test.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.exam.test.vo.MemberVo;
import com.exam.test.vo.TestVo;

public interface TestMapper {
public List<TestVo> testList();

public MemberVo login(@Param("id")String id ,@Param("pw") String pw );
	
}
