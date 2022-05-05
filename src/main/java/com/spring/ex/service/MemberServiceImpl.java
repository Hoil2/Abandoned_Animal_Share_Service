package com.spring.ex.service;

import java.util.HashMap;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.ex.dao.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	private MemberDAO dao;
	
	/*
	//회원가입
	@Override
	public void signUp(MemberDTO dto) throws Exception {
		dao.signUp(dto);
	}

	//로그인
	@Override
	public MemberDTO login(MemberDTO dto) throws Exception {
		return dao.login(dto);
	}
	*/
	
	// 회원 아이디 찾기
	@Override
	public int findUserId(String email, String pw) throws Exception{
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("email", email);
		map.put("password", pw);
		return dao.findUserId(map);
	}
}
