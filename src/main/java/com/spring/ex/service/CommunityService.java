package com.spring.ex.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.ex.dto.CommunityDTO;

@Service
public interface CommunityService {
	// 게시판 페이지 가져오기
	public List<HashMap<String, Object>> getBoardPage(HashMap<String, Object> map) throws Exception;
	
	// 게시판의 게시물 총 개수
	public int getCommunityBoardPostTotalCount(HashMap<String, Object> map) throws Exception;
	
	// 정보 공유 게시판에 등록
	public int submitPost(HashMap<String, Object> map) throws Exception;
	
	//게시물 상세 페이지 가져오기 
	public HashMap<String, Object> getPageDetail(int pageNo) throws Exception;
	
	// 게시물에 조회수 1 추가
	public int addHitToBoardPage(int pageNo) throws Exception;
	
	// 댓글 달기
	public int submitComment(HashMap<String, Object> map) throws Exception;
	
	// 댓글 가져오기
	public List<HashMap<String, Object>> getComment(int pageNo) throws Exception;
	
	// 좋아요 개수 가져오기
	public int getCommunityLikeCount(int cb_id);
	
	// 좋아요 추가
	public int insertCommunityLike(int cb_id, int m_id);
	
	// 좋아요 삭제
	public int deleteCommunityLike(int cb_id, int m_id);
	
	// 좋아요가 존재하는지
	public int existCommunityLike(int cb_id, int m_id);
}
