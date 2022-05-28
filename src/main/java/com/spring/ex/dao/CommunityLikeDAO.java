package com.spring.ex.dao;

import org.springframework.stereotype.Repository;

@Repository
public interface CommunityLikeDAO {
	// 좋아요 개수 가져오기
	public int getCommunityLikeCount(int cb_id);
	
	// 좋아요 추가
	public int insertCommunityLike(int cb_id, int m_id);
	
	// 좋아요 삭제
	public int deleteCommunityLike(int cb_id, int m_id);
	
	// 좋아요가 존재하는지
	public int existCommunityLike(int cb_id, int m_id);
}
