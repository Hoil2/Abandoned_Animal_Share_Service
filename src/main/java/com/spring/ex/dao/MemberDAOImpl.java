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
	
	private static String namespcae = "com.spring.ex.memberMapper";
	
	//회원가입
	@Override
	public void signUp(MemberDTO dto) throws Exception {
		sql.insert(namespcae + ".signUp", dto);
	}

	//로그인
	@Override
	public MemberDTO signIn(HashMap<String, String> map) throws Exception {
		return sql.selectOne(namespcae + ".signIn", map);
	}
	
	
	// 회원 아이디 찾기
	@Override
	public int findUserId(HashMap<String, String> map) throws Exception {
		return sql.selectOne(namespcae + ".findUserId", map);
	}

	@Override
	public String getNameByM_id(int m_id) throws Exception {
		return sql.selectOne(namespcae + ".getNameByM_id", m_id);
	}

	@Override
	public MemberDTO getMemberByM_id(int m_id) throws Exception {
		return sql.selectOne(namespcae + ".getMemberByM_id", m_id);
	}

	// 멤버 리스트 가져오기
	@Override
	public List<MemberDTO> getMemberList() {
		return sql.selectList(namespcae + ".getMemberList");
	}
}
