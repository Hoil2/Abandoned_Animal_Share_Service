package com.spring.ex.admin.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository
public interface AdminMemberDAO {
	// 관리자 회원 게시판 가져오기
	public List<Map<String, Object>> getMemberBoard(String searchCategory, String searchKeyword, int nowPage, int pageSize);
	
	// 관리자 회원 게시물 총 개수 가져오기
	public int getMemberPostCount(String searchCategory, String searchKeyword);
	
}
