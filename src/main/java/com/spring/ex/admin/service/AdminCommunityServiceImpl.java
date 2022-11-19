package com.spring.ex.admin.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.ex.admin.dao.AdminCommunityDAO;

@Service
public class AdminCommunityServiceImpl implements AdminCommunityService {
	
	@Inject
	private AdminCommunityDAO adminCommunityDAO;

	// 커뮤니티 게시물 리스트 가져오기
	@Override
	public List<Map<String, Object>> getAdminBoardPage(String search, String filter, int classify, int nowPage, int pageSize) {
		return adminCommunityDAO.getAdminBoardPage(search, filter, classify, nowPage, pageSize);
	}

	// 커뮤니티 게시물 리스트 개수 가져오기	
	@Override
	public int getAdminBoardPageCount(String search, String filter, int classify) {
		return adminCommunityDAO.getAdminBoardPageCount(search, filter, classify);
	}

	// 7일간 게시물 등록 개수 가져오기
	@Override
	public List<Map<String, Object>> getPostCountBy7Day() {
		return adminCommunityDAO.getPostCountBy7Day();
	}

	// 7일간 특정 게시판의 게시물 등록 개수 가져오기
	@Override
	public List<Map<String, Object>> getPostCountBy7Day(int classify) {
		return adminCommunityDAO.getPostCountBy7Day(classify);
	}

	// 오늘의 게시물 등록 개수 가져오기
	@Override
	public int getPostCountOfToday() {
		return adminCommunityDAO.getPostCountOfToday();
	}

	// 오늘의 특정 게시판의 게시물 등록 개수 가져오기
	@Override
	public int getPostCountOfToday(int classify) {
		return adminCommunityDAO.getPostCountOfToday(classify);
	}

	@Override
	public List<Map<String, Object>> getAdminMemberBoard(int m_id, int nowPage, int pageSize) {
		return adminCommunityDAO.getAdminMemberBoard(m_id, nowPage, pageSize);
	}

	@Override
	public int getAdminMemberPostTotalCount(int m_id) {
		return adminCommunityDAO.getAdminMemberPostTotalCount(m_id);
	}

}
