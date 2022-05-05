package com.spring.ex.dao;

import java.util.HashMap;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.spring.ex.dto.MemberDTO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Inject
	private SqlSession sql;
	
	private static String namespcae = "com.spring.ex.memberMapper";
	
	/*
	//회원가입
	@Override
	public void signUp(MemberDTO dto) throws Exception {
		sql.insert(namespcae + ".signUp", dto);
	}

	//로그인
	@Override
	public MemberDTO login(MemberDTO dto) throws Exception {
		return sql.selectOne(namespcae + ".login", dto);
	}
	*/
	
	// 회원 아이디 찾기
	@Override
	public int findUserId(HashMap<String, String> map) throws Exception {
		return sql.selectOne(namespcae + ".findUserId", map);
	}
}
