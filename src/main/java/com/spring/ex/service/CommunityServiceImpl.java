package com.spring.ex.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.ex.dao.CommentDAO;
import com.spring.ex.dao.CommunityDAO;
import com.spring.ex.dao.CommunityLikeDAO;
import com.spring.ex.dto.CommentDTO;
import com.spring.ex.dto.CommunityDTO;

@Service
public class CommunityServiceImpl implements CommunityService {
	
	@Inject
	private CommunityDAO communityDAO;
	
	@Inject
	private CommentDAO commentDAO;
	
	@Inject
	private CommunityLikeDAO communityLikeDAO;
	
	@Override
	public List<HashMap<String, Object>> getBoardPage(HashMap<String, Object> map) throws Exception {
		return communityDAO.getBoardPage(map);
	}

	// 정보 공유 게시판의 게시물 총 개수
	@Override
	public int getCommunityBoardPostTotalCount(HashMap<String, Object> map) throws Exception {
		return communityDAO.getCommunityBoardPostTotalCount(map);
	}
	
	// 정보 공유 게시판에 등록
	@Override
	public int submitPost(CommunityDTO dto) throws Exception {
		return communityDAO.submitPost(dto);
	}
	
	//게시물 상세 페이지 가져오기
	@Override
	public CommunityDTO getPageDetail(int pageNo) throws Exception {
		return communityDAO.getPageDetail(pageNo);
	}
	
	// 게시물 수정
	@Override
	public int updatePost(CommunityDTO dto) throws Exception {
		return communityDAO.updatePost(dto);
	}

	// 게시물 삭제
	@Override
	public int deletePost(int pageNo) throws Exception {
		return communityDAO.deletePost(pageNo);
	}
	
	// 게시물에 조회수 1 추가
	@Override
	public int addHitToBoardPage(int pageNo) throws Exception {
		return communityDAO.addHitToBoardPage(pageNo);
	}
	
	// 댓글
	@Override
	public List<HashMap<String, Object>> selectCommentList(int pageNo) throws Exception {
		return commentDAO.selectCommentList(pageNo);
	}
	
	@Override
	public int insertComment(HashMap<String, Object> map) throws Exception {
		return commentDAO.insertComment(map);
	}

	@Override
	public int updateComment(CommentDTO dto) throws Exception {
		return commentDAO.updateComment(dto);
	}

	@Override
	public int deleteComment(int cbr_id) throws Exception {
		return commentDAO.deleteComment(cbr_id);
	}

	// 좋아요
	@Override
	public int getCommunityLikeCount(int cb_id) {
		return communityLikeDAO.getCommunityLikeCount(cb_id);
	}

	@Override
	public int insertCommunityLike(int cb_id, int m_id) {
		return communityLikeDAO.insertCommunityLike(cb_id, m_id);
	}

	@Override
	public int deleteCommunityLike(int cb_id, int m_id) {
		return communityLikeDAO.deleteCommunityLike(cb_id, m_id);
	}

	@Override
	public int existCommunityLike(int cb_id, int m_id) {
		return communityLikeDAO.existCommunityLike(cb_id, m_id);
	}
}
