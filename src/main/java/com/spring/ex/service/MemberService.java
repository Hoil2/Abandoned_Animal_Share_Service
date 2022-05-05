package com.spring.ex.service;

import org.springframework.stereotype.Service;

@Service
public interface MemberService {
	
	/*
	//회원 가입
	public void signUp(MemberDTO dto) throws Exception;
	
	//로그인
	public MemberDTO login(MemberDTO dto) throws Exception;
	*/
	
	// 회원 아이디 찾기
	public int findUserId(String email, String pw) throws Exception;
}
