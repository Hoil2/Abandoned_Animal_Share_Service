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
	public List<HashMap<String, Object>> getCommunityInfoBoardPage(HashMap<String, Integer> map) throws Exception {
		return sqlSession.selectList(namespace + ".getCommunityInfoBoardPage", map);
	}

	@Override
	public int getCommunityInfoBoardPostTotalCount() throws Exception {
		return sqlSession.selectOne(namespace + ".getCommunityInfoBoardPostTotalCount");
	}
	
	@Override
	public int submitInfoPost(HashMap<String, Object> map) throws Exception {
		return sqlSession.insert(namespace + ".submitInfoPost", map);
	}
	
	//게시물 상세 페이지 가져오기 
	@Override
	public HashMap<String, Object> getPageDetail(int pageNo) throws Exception {
		return sqlSession.selectOne(namespace + ".getPageDetail", pageNo);
	}
}
