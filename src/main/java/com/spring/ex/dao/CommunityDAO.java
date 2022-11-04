package com.spring.ex.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.spring.ex.dto.CommunityDTO;
import com.spring.ex.dto.FileUploadDTO;

@Repository
public interface CommunityDAO {
	// 게시판 페이지 가져오기
	public List<HashMap<String, Object>> getBoardPage(HashMap<String, Object> map) throws Exception;
	
	// 게시판의 게시물 총 개수
	public int getCommunityBoardPostTotalCount(HashMap<String, Object> map) throws Exception;
	
	// 게시물 상세 페이지 가져오기 
	public CommunityDTO getPageDetail(int pageNo);
	
	// 게시물 추가
	public int insertPost(CommunityDTO dto);
	
	// 게시물 수정
	public int updatePost(CommunityDTO dto);
	
	// 게시물 삭제
	public int deletePost(int pageNo);
	
	// 게시물에 조회수 1 추가
	public int addHitToBoardPage(int pageNo) throws Exception;
	
	// 파일 검색
	public List<FileUploadDTO> selectFileListByCb_id(int cb_id) throws Exception;
	
	// 파일 추가
	public int insertFile(FileUploadDTO dto) throws Exception;
	
	// 파일 삭제
	public int deleteFileByUrl(String url) throws Exception;
}
