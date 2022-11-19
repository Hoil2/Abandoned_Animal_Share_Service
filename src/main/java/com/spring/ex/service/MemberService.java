package com.spring.ex.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.ex.dto.MemberDTO;

@Service
public interface MemberService {
	
	//회원 가입
	public void signUp(MemberDTO dto) throws Exception;
	
	//로그인
	public MemberDTO signIn(String email, String pw) throws Exception;
	
	// 회원 아이디 찾기
	public int findUserId(String email, String pw) throws Exception;
	
	// 아이디로 이름 찾기
	public String getNameByM_id(int m_id) throws Exception;
	
	// 아이디로 회원 정보 가져오기
	public MemberDTO getMemberByM_id(int m_id) throws Exception;
	
	// 이메일로 회원 정보 가져오기
	public MemberDTO getMemberByEmail(String email);
	
	// 멤버 리스트 가져오기
	public List<MemberDTO> getMemberList();
}
