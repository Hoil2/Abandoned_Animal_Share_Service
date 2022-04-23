package com.spring.ex.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.spring.ex.dto.MemberDTO;

@Service
public class MemberDAOImpl implements MemberDAO {

	//mybatis
	@Inject
	private SqlSession sql;
	
	//mapper
	private static String namespcae = "com.spring.mappers.memberMapper";
	
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
}
