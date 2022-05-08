package com.spring.ex.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.spring.ex.dto.CommunityDTO;

@Repository
public interface CommunityDAO {
	// 일상 공유 게시판 페이지 가져오기
	public List<HashMap<String, Object>> getCommunityDailyBoardPage(HashMap<String, Integer> map) throws Exception;
	
	// 정보 공유 게시판 페이지 가져오기
	public List<HashMap<String, Object>> getCommunityInfoBoardPage(HashMap<String, Integer> map) throws Exception;
	
	// 게시판의 게시물 총 개수
	public int getCommunityBoardPostTotalCount(int classify) throws Exception;
	
	// 정보 공유 게시판에 등록
	public int submitInfoPost(HashMap<String, Object> map) throws Exception;
	
	// 게시물 상세 페이지 가져오기 
	public HashMap<String, Object> getPageDetail(int pageNo) throws Exception;
}
