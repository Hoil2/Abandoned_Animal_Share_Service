package com.spring.ex.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.ex.dto.ShelterDTO;

@Repository
public class ShelterDAOImpl implements ShelterDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private String shelterNamespace = "com.spring.ex.ShelterMapper";
	private String shareCenterNamespace = "com.spring.ex.ShareCenterMapper";
	
	@Override
	public List<ShelterDTO> selectAllShelterList() {
		return sqlSession.selectList(shelterNamespace + ".selectAllShelterList");
	}

	@Override
	public List<HashMap> getShareCenterBoardPageByAddress(HashMap<String, Object> map) {
		return sqlSession.selectList(shareCenterNamespace + ".getShareCenterBoardPageByAddress", map);
	}

	@Override
	public int getShareCenterBoardViewTotalCountByAddress(HashMap<String, Object> map) {
		return sqlSession.selectOne(shareCenterNamespace + ".getShareCenterBoardViewTotalCountByAddress", map);
	}

}
