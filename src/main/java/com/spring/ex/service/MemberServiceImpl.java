package com.spring.ex.service;

import java.util.HashMap;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.ex.dao.MemberDAO;
import com.spring.ex.dto.MemberDTO;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	private MemberDAO dao;
	
	//회원가입
	@Override
	public void signUp(MemberDTO dto) throws Exception {
		dao.signUp(dto);
	}

	//로그인
	@Override
	public MemberDTO signIn(String email, String pw) throws Exception {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("email", email);
		map.put("password", pw);
		return dao.signIn(map);
	}
	
	// 회원 아이디 찾기
	@Override
	public int findUserId(String email, String pw) throws Exception{
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("email", email);
		map.put("password", pw);
		return dao.findUserId(map);
	}

	@Override
	public String getNameByM_id(int m_id) throws Exception {
		return dao.getNameByM_id(m_id);
	}

	@Override
	public MemberDTO getMemberByM_id(int m_id) throws Exception {
		return dao.getMemberByM_id(m_id);
	}
}
