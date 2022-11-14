package com.spring.ex.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.spring.ex.dto.MemberDTO;

@Service
public interface AdminMemberService {
	// 관리자 회원 게시판 가져오기
	public List<Map<String, Object>> getMemberBoard(String searchCategory, String searchKeyword, int nowPage, int pageSize);
	
	// 관리자 회원 게시물 총 개수 가져오기
	public int getMemberPostCount(String searchCategory, String searchKeyword);
	
	// 회원 추가
	public int insertMember(MemberDTO dto);
	
	// 회원 수정
	public int updateMember(MemberDTO dto);
	
	// 회원 삭제
	public int deleteMember(int m_id);
}
