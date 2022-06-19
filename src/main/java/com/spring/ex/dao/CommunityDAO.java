package com.spring.ex.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.spring.ex.dto.CommunityDTO;

@Repository
public interface CommunityDAO {
	// 게시판 페이지 가져오기
	public List<HashMap<String, Object>> getBoardPage(HashMap<String, Object> map) throws Exception;
	
	// 게시판의 게시물 총 개수
	public int getCommunityBoardPostTotalCount(HashMap<String, Object> map) throws Exception;
	
	// 정보 공유 게시판에 등록
	public int submitPost(CommunityDTO dto) throws Exception;
	
	// 게시물 상세 페이지 가져오기 
	public CommunityDTO getPageDetail(int pageNo) throws Exception;
	
	// 게시물에 조회수 1 추가
	public int addHitToBoardPage(int pageNo) throws Exception;
	
	// 댓글 달기
	public int submitComment(HashMap<String, Object> map) throws Exception;
	
	// 댓글 가져오기
	public List<HashMap<String, Object>> getComment(int pageNo) throws Exception;
}
