package com.spring.ex.admin.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.ex.admin.dao.AdminMemberDAO;

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
	
}
