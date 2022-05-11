package com.spring.ex.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class CommunityDAOImpl implements CommunityDAO {
	
	@Inject
	private SqlSession sqlSession;
	private static final String namespace = "com.spring.ex.CommunityMapper";
	
	@Override
	public List<HashMap<String, Object>> getDictionaryBoardPage(HashMap<String, Integer> map) throws Exception {
		return sqlSession.selectList(namespace + ".getDictionaryBoardPage", map);
	}
	
	@Override
	public List<HashMap<String, Object>> getCommunityDailyBoardPage(HashMap<String, Integer> map) throws Exception {
		return sqlSession.selectList(namespace + ".getCommunityDailyBoardPage", map);
	}
	
	@Override
	public List<HashMap<String, Object>> getCommunityInfoBoardPage(HashMap<String, Integer> map) throws Exception {
		return sqlSession.selectList(namespace + ".getCommunityInfoBoardPage", map);
	}

	@Override
	public int getCommunityBoardPostTotalCount(int classify) throws Exception {
		return sqlSession.selectOne(namespace + ".getCommunityBoardPostTotalCount", classify);
	}
	
	@Override
	public int submitInfoPost(HashMap<String, Object> map) throws Exception {
		return sqlSession.insert(namespace + ".submitInfoPost", map);
	}
	
	@Override
	public HashMap<String, Object> getPageDetail(int pageNo) throws Exception {
		return sqlSession.selectOne(namespace + ".getPageDetail", pageNo);
	}

	@Override
	public int addHitToBoardPage(int pageNo) throws Exception {
		return sqlSession.update(namespace + ".addHitToBoardPage", pageNo);
	}
}
