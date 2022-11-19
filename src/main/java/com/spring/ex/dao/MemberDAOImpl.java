package com.spring.ex.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.ex.dto.MemberDTO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Inject
	private SqlSession sql;
	
	private static String namespace = "com.spring.ex.memberMapper";
	
	//회원가입
	@Override
	public void signUp(MemberDTO dto) throws Exception {
		sql.insert(namespace + ".signUp", dto);
	}

	//로그인
	@Override
	public MemberDTO signIn(HashMap<String, String> map) throws Exception {
		return sql.selectOne(namespace + ".signIn", map);
	}
	
	
	// 회원 아이디 찾기
	@Override
	public int findUserId(HashMap<String, String> map) throws Exception {
		return sql.selectOne(namespace + ".findUserId", map);
	}

	@Override
	public String getNameByM_id(int m_id) throws Exception {
		return sql.selectOne(namespace + ".getNameByM_id", m_id);
	}

	@Override
	public MemberDTO getMemberByM_id(int m_id) throws Exception {
		return sql.selectOne(namespace + ".getMemberByM_id", m_id);
	}

	@Override
	public MemberDTO getMemberByEmail(String email) {
		return sql.selectOne(namespace + ".getMemberByEmail", email);
	}
	
	// 멤버 리스트 가져오기
	@Override
	public List<MemberDTO> getMemberList() {
		return sql.selectList(namespace + ".getMemberList");
	}
}
