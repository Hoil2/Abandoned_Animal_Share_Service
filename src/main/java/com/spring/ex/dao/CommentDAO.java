package com.spring.ex.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.spring.ex.dto.CommentDTO;

@Repository
public interface CommentDAO {
	// 댓글 가져오기
	public List<HashMap<String, Object>> selectCommentList(int pageNo) throws Exception;
	
	// 댓글 달기
	public int insertComment(CommentDTO dto) throws Exception;
	
	// 댓글 수정
	public int updateComment(CommentDTO dto) throws Exception;
	
	// 댓글 삭제
	public int deleteComment(int cbr_id) throws Exception;
}
