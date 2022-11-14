package com.spring.ex.admin.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.ex.dto.MemberDTO;

@Repository
public class AdminMemberDAOImpl implements AdminMemberDAO {

	@Inject
	private SqlSession sql;
	
	private final String namespace = "com.spring.ex.AdminMemberMapper";
	
	// 관리자 회원 게시판 가져오기
	@Override
	public List<Map<String, Object>> getMemberBoard(String searchCategory, String searchKeyword, int nowPage, int pageSize) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchCategory", searchCategory);
		map.put("searchKeyword", searchKeyword);
		map.put("nowPage", nowPage);
		map.put("pageSize", pageSize);
		return sql.selectList(namespace + ".getMemberBoard", map);
	}

	// 관리자 회원 게시물 총 개수 가져오기
	@Override
	public int getMemberPostCount(String searchCategory, String searchKeyword) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchCategory", searchCategory);
		map.put("searchKeyword", searchKeyword);
		return sql.selectOne(namespace + ".getMemberPostCount", map);
	}

	// 회원 추가
	@Override
	public int insertMember(MemberDTO dto) {
		return sql.insert(namespace + ".insertMember", dto);
	}

	// 회원 수정
	@Override
	public int updateMember(MemberDTO dto) {
		return sql.update(namespace + ".updateMember", dto);
	}

	// 회원 삭제
	@Override
	public int deleteMember(int m_id) {
		return sql.delete(namespace + ".deleteMember", m_id);
	}
	
}
