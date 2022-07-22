package com.spring.ex.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.ex.dto.CommunityDTO;

@Repository
public class CommunityDAOImpl implements CommunityDAO {
	
	@Inject
	private SqlSession sqlSession;
	private static final String namespace = "com.spring.ex.CommunityMapper";
	
	@Override
	public List<HashMap<String, Object>> getBoardPage(HashMap<String, Object> map) throws Exception {
		return sqlSession.selectList(namespace + ".getBoardPage", map);
	}
	
	@Override
	public int getCommunityBoardPostTotalCount(HashMap<String, Object> map) throws Exception {
		return sqlSession.selectOne(namespace + ".getCommunityBoardPostTotalCount", map);
	}
	
	@Override
	public CommunityDTO getPageDetail(int pageNo) throws Exception {
		return sqlSession.selectOne(namespace + ".getPageDetail", pageNo);
	}
	
	@Override
	public int submitPost(CommunityDTO dto) throws Exception {
		return sqlSession.insert(namespace + ".submitPost", dto);
	}

	@Override
	public int updatePost(CommunityDTO dto) throws Exception {
		return sqlSession.update(namespace + ".updatePost", dto);
	}

	@Override
	public int deletePost(int pageNo) throws Exception {
		return sqlSession.update(namespace + ".deletePost", pageNo);
	}
	
	@Override
	public int addHitToBoardPage(int pageNo) throws Exception {
		return sqlSession.update(namespace + ".addHitToBoardPage", pageNo);
	}
}
