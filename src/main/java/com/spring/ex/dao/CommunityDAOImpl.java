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
	public List<CommunityDTO> getCommunityInfoBoardPage(HashMap<String, Integer> map) throws Exception {
		return sqlSession.selectList(namespace + ".getCommunityInfoBoardPage", map);
	}

	@Override
	public int getCommunityInfoBoardPostTotalCount() throws Exception {
		return sqlSession.selectOne(namespace + ".getCommunityInfoBoardPostTotalCount");
	}

}
