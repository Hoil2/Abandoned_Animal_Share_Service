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
	
	// 정보 공유 게시판 페이지 가져오기
	@Override
	public List<CommunityDTO> getCommunityInfoBoardPage(HashMap<String, Integer> map) throws Exception {
		return dao.getCommunityInfoBoardPage(map);
	}

	// 정보 공유 게시판의 게시물 총 개수
	@Override
	public int getCommunityInfoBoardPostTotalCount() throws Exception {
		return dao.getCommunityInfoBoardPostTotalCount();
	}

}
