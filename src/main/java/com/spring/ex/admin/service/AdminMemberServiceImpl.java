package com.spring.ex.admin.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.ex.admin.dao.AdminMemberDAO;
import com.spring.ex.dto.MemberDTO;

@Service
public class AdminMemberServiceImpl implements AdminMemberService {

	@Inject
	private AdminMemberDAO adminMemberDAO;
	
	// 관리자 회원 게시판 가져오기
	@Override
	public List<Map<String, Object>> getMemberBoard(String searchCategory, String searchKeyword, int nowPage, int pageSize) {
		return adminMemberDAO.getMemberBoard(searchCategory, searchKeyword, nowPage, pageSize);
	}

	// 관리자 회원 게시물 총 개수 가져오기
	@Override
	public int getMemberPostCount(String searchCategory, String searchKeyword) {
		return adminMemberDAO.getMemberPostCount(searchCategory, searchKeyword);
	}
		
	// 회원 추가
	@Override
	public int insertMember(MemberDTO dto) {
		return adminMemberDAO.insertMember(dto);
	}

	// 회원 수정
	@Override
	public int updateMember(MemberDTO dto) {
		return adminMemberDAO.updateMember(dto);
	}
	
	// 회원 삭제
	@Override
	public int deleteMember(int m_id) {
		return adminMemberDAO.deleteMember(m_id);
	}
	
}
