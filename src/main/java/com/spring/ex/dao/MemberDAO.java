package com.spring.ex.dao;

import java.util.HashMap;

import org.springframework.stereotype.Repository;

import com.spring.ex.dto.MemberDTO;

@Repository
public interface MemberDAO {
	// 회원가입
	public void signUp(MemberDTO dto) throws Exception;
	
	// 로그인
	public MemberDTO signIn(HashMap<String, String> map) throws Exception;
	
	// 회원 아이디 찾기
	public int findUserId(HashMap<String, String> map) throws Exception;
	
	// 아이디로 이름 찾기
	public String getNameByM_id(int m_id) throws Exception;
	
	// 아이디로 회원 정보 가져오기
	public MemberDTO getMemberByM_id(int m_id) throws Exception;
}
