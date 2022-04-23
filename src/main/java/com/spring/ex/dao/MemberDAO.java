package com.spring.ex.dao;

import com.spring.ex.dto.MemberDTO;

public interface MemberDAO {
	
	//회원 가입
	public void signUp(MemberDTO dto) throws Exception;
	
	//로그인
	public MemberDTO login(MemberDTO dto) throws Exception;
}
