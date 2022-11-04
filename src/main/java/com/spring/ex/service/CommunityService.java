package com.spring.ex.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.ex.dto.CommentDTO;
import com.spring.ex.dto.CommunityDTO;
import com.spring.ex.dto.FileUploadDTO;

@Service
public interface CommunityService {
	// 게시판 페이지 가져오기
	public List<HashMap<String, Object>> getBoardPage(HashMap<String, Object> map) throws Exception;
	
	// 게시판의 게시물 총 개수
	public int getCommunityBoardPostTotalCount(HashMap<String, Object> map) throws Exception;
	
	// 게시물 추가
	public int insertPost(CommunityDTO dto);
	
	// 게시물 상세 페이지 가져오기 
	public CommunityDTO getPageDetail(int pageNo);
	
	// 게시물 수정
	public int updatePost(CommunityDTO dto);
	
	// 게시물 삭제
	public int deletePost(int pageNo);
	
	// 게시물에 조회수 1 추가
	public int addHitToBoardPage(int pageNo) throws Exception;
	
	// 댓글 가져오기
	public List<HashMap<String, Object>> selectCommentList(int pageNo) throws Exception;
	
	// 댓글 달기
	public int insertComment(CommentDTO dto) throws Exception;
	
	// 댓글 수정
	public int updateComment(CommentDTO dto) throws Exception;
	
	// 댓글 삭제
	public int deleteComment(int cbr_id) throws Exception;
	
	// 좋아요 개수 가져오기
	public int getCommunityLikeCount(int cb_id);
	
	// 좋아요 추가
	public int insertCommunityLike(int cb_id, int m_id);
	
	// 좋아요 삭제
	public int deleteCommunityLike(int cb_id, int m_id);
	
	// 좋아요가 존재하는지
	public int existCommunityLike(int cb_id, int m_id);
	
	// classify를 url로 변환
	public String convertClassifyToUrl(int classify);
	
	// 파일 검색
	public List<FileUploadDTO> selectFileListByCb_id(int cb_id) throws Exception;

	// String으로 파일 검색 
	public List<String> selectUrlListByCb_id(int cb_id) throws Exception;
	
	// 파일 추가
	public int insertFile(FileUploadDTO dto) throws Exception;
	
	// 파일 삭제
	public int deleteFileByUrl(String url) throws Exception;
	
	// 서버, 로컬, 데이터베이스에서 파일 삭제
	public int deleteFileEveryWhere(String url, String contextRoot) throws Exception;
	
	// html 태그의 img src 값을 리스트로 반환
	public List<String> convertHtmlToSrcList(String html) throws Exception;
	
	// srcList를 로컬 저장소에 복사
	public void copySrcListToLocal(List<String> srcList, String contextRoot) throws Exception;
	
	// 메인의 url에 없는 것은 삭제
	public void deleteFileNotInMain(List<String> main, List<String> target, String contextRoot) throws Exception;
}
