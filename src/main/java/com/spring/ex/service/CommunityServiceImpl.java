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
	public List<HashMap<String, Object>> getBoardPage(HashMap<String, Object> map) throws Exception {
		return dao.getBoardPage(map);
	}

	@Override
	public List<HashMap<String, Object>> getBoardPageWithTitle(HashMap<String, Object> map) throws Exception {
		return dao.getBoardPageWithTitle(map);
	}

	@Override
	public List<HashMap<String, Object>> getBoardPageWithContent(HashMap<String, Object> map) throws Exception {
		return dao.getBoardPageWithContent(map);
	}

	@Override
	public List<HashMap<String, Object>> getBoardPageWithTitleOrContent(HashMap<String, Object> map) throws Exception {
		return dao.getBoardPageWithTitleOrContent(map);
	}
	
	// 정보 공유 게시판의 게시물 총 개수
	@Override
	public int getCommunityBoardPostTotalCount(int classify) throws Exception {
		return dao.getCommunityBoardPostTotalCount(classify);
	}
	
	// 정보 공유 게시판에 등록
	@Override
	public int submitPost(HashMap<String, Object> map) throws Exception {
		return dao.submitPost(map);
	}
	
	//게시물 상세 페이지 가져오기
	@Override
	public HashMap<String, Object> getPageDetail(int pageNo) throws Exception {
		return dao.getPageDetail(pageNo);
	}
	
	// 게시물에 조회수 1 추가
	@Override
	public int addHitToBoardPage(int pageNo) throws Exception {
		return dao.addHitToBoardPage(pageNo);
	}
	
	// 댓글 달기
	@Override
	public int submitComment(HashMap<String, Object> map) throws Exception {
		return dao.submitComment(map);
	}

	@Override
	public List<HashMap<String, Object>> getComment(int pageNo) throws Exception {
		return dao.getComment(pageNo);
	}
}
