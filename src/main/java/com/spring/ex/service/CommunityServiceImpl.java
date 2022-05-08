package com.spring.ex.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.ex.dao.CommunityDAO;
import com.spring.ex.dto.CommunityDTO;

@Service
public class CommunityServiceImpl implements CommunityService {
	
	@Inject
	private CommunityDAO dao;
	
	@Override
	public List<HashMap<String, Object>> getCommunityDailyBoardPage(HashMap<String, Integer> map) throws Exception {
		return dao.getCommunityDailyBoardPage(map);
	}
	
	// 정보 공유 게시판 페이지 가져오기
	@Override
	public List<HashMap<String, Object>> getCommunityInfoBoardPage(HashMap<String, Integer> map) throws Exception {
		return dao.getCommunityInfoBoardPage(map);
	}

	// 정보 공유 게시판의 게시물 총 개수
	@Override
	public int getCommunityBoardPostTotalCount(int classify) throws Exception {
		return dao.getCommunityBoardPostTotalCount(classify);
	}
	
	// 정보 공유 게시판에 등록
	@Override
	public int submitInfoPost(HashMap<String, Object> map) throws Exception {
		return dao.submitInfoPost(map);
	}
	
	//게시물 상세 페이지 가져오기
	@Override
	public HashMap<String, Object> getPageDetail(int pageNo) throws Exception {
		return dao.getPageDetail(pageNo);
	}
}
