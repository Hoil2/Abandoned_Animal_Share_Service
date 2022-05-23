package com.spring.ex.dao;

import java.util.HashMap;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class CommunityLikeDAOImpl implements CommunityLikeDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private final String namespace = "com.spring.ex.CommunityMapper";
	
	@Override
	public int getCommunityLikeCount(int cb_id) {
		return sqlSession.selectOne(namespace + ".getCommunityLikeCount", cb_id);
	}

	@Override
	public int insertCommunityLike(int cb_id, int m_id) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("cb_id", cb_id);
		map.put("m_id", m_id);
		return sqlSession.insert(namespace + ".insertCommunityLike", map);
	}

	@Override
	public int deleteCommunityLike(int cb_id, int m_id) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("cb_id", cb_id);
		map.put("m_id", m_id);
		return sqlSession.delete(namespace + ".deleteCommunityLike", map);
	}

	@Override
	public int existCommunityLike(int cb_id, int m_id) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("cb_id", cb_id);
		map.put("m_id", m_id);
		return sqlSession.selectOne(namespace + ".existCommunityLike", map);
	}
	
}
