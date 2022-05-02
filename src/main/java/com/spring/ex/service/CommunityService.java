package com.spring.ex.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.ex.dto.CommunityDTO;

@Service
public interface CommunityService {
	// 정보 공유 게시판 페이지 가져오기
	public List<CommunityDTO> getCommunityInfoBoardPage(HashMap<String, Integer> map) throws Exception;
	
	// 정보 공유 게시판의 게시물 총 개수
	public int getCommunityInfoBoardPostTotalCount() throws Exception;
}
