package com.spring.ex.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

@Service
public interface AdminCommunityService {
	
	// 커뮤니티 게시물 리스트 가져오기
	public List<Map<String, Object>> getAdminBoardPage(String search, String filter, int classify, int nowPage, int pageSize);

	// 커뮤니티 게시물 리스트 개수 가져오기	
	public int getAdminBoardPageCount(String search, String filter, int classify);
	
	// 7일간 게시물 등록 개수 가져오기
	public List<Map<String, Object>> getPostCountBy7Day();
	
	// 7일간 특정 게시판의 게시물 등록 개수 가져오기
	public List<Map<String, Object>> getPostCountBy7Day(int classify);
	
	// 오늘의 게시물 등록 개수 가져오기
	public int getPostCountOfToday();
	
	// 오늘의 특정 게시판의 게시물 등록 개수 가져오기
	public int getPostCountOfToday(int classify);
	
	// 멤버가 작성한 커뮤니티 게시물 리스트 가져오기
	public List<Map<String, Object>> getAdminMemberBoard(int m_id, int nowPage, int pageSize);
	
	// 멤버가 작성한 커뮤니티 게시물 개수 가져오기
	public int getAdminMemberPostTotalCount(int m_id);
}
