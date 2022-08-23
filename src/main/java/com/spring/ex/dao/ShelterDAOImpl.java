package com.spring.ex.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.ex.dto.ShelterDTO;

@Repository
public class ShelterDAOImpl implements ShelterDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private String namespace = "com.spring.ex.ShelterMapper";
	
	@Override
	public List<ShelterDTO> selectAllShelterList() {
		return sqlSession.selectList(namespace + ".selectAllShelterList");
	}

}
