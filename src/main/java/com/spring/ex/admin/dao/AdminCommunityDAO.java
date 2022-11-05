package com.spring.ex.admin.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository
public interface AdminCommunityDAO {
	
	// 커뮤니티 게시물 리스트 가져오기
	public List<Map<String, Object>> getAdminBoardPage(String search, String filter, int classify, int nowPage, int pageSize);

	// 커뮤니티 게시물 리스트 개수 가져오기	
	public int getAdminBoardPageCount(String search, String filter, int classify);
	
	// 7일간 게시물 등록 개수 가져오기
	public Map<String, Integer> getPostCountBy7Day();
	
	// 7일간 특정 게시판의 게시물 등록 개수 가져오기
	public Map<String, Integer> getPostCountBy7Day(int classify);
	
	// 오늘의 게시물 등록 개수 가져오기
	public int getPostCountOfToday();
	
	// 오늘의 특정 게시판의 게시물 등록 개수 가져오기
	public int getPostCountOfToday(int classify);
	
}
