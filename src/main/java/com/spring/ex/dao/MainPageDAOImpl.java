package com.spring.ex.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.ex.dto.CommunityDTO;
import com.spring.ex.dto.LostAnimalDTO;
import com.spring.ex.dto.ShareCenterDTO;


@Repository
public class MainPageDAOImpl implements MainPageDAO{
	
	@Inject
	private SqlSession sqlSession;
	private static final String namespace = "com.spring.ex.MainPageMapper";
	
	@Override
	public List<ShareCenterDTO> getPopularityShareCenterList() throws Exception {
		return sqlSession.selectList(namespace + ".getPopularityShareCenterList");
	}

	@Override
	public List<CommunityDTO> getPopularityDailyCommunityBoardList(int classify) throws Exception {
		return sqlSession.selectList(namespace + ".getPopularityDailyCommunityBoardList", classify);
	}
	
	@Override
	public List<LostAnimalDTO> getMainPageLostAnimalBoardList() throws Exception {
		return sqlSession.selectList(namespace + ".getMainPageLostAnimalBoardList");
	}
}