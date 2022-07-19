package com.spring.ex.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.ex.dto.CommentDTO;

@Repository
public class CommentDAOImpl implements CommentDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private final String namespace = "com.spring.ex.CommentMapper"; 
	
	@Override
	public List<HashMap<String, Object>> selectCommentList(int pageNo) throws Exception {
		return sqlSession.selectList(namespace + ".selectCommentList", pageNo);
	}
	
	@Override
	public int insertComment(HashMap<String, Object> map) throws Exception {
		return sqlSession.insert(namespace + ".insertComment", map);
	}

	@Override
	public int updateComment(CommentDTO dto) throws Exception {
		return sqlSession.update(namespace + ".updateComment", dto);
	}

	@Override
	public int deleteComment(int cbr_id) throws Exception {
		return sqlSession.delete(namespace + ".deleteComment", cbr_id);
	}
}
