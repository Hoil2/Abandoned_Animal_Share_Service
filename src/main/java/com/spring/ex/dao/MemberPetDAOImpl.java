package com.spring.ex.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.ex.dto.MemberPetDTO;

@Repository
public class MemberPetDAOImpl implements MemberPetDAO {

	@Inject
	private SqlSession sqlSession;
	
	private final String namespace = "com.spring.ex.MemberPetMapper";
	
	@Override
	public int insertMemberPet(MemberPetDTO dto) {
		return sqlSession.insert(namespace + ".insertMemberPet", dto);
	}

	@Override
	public int deleteMemberPet(int m_id) {
		return sqlSession.delete(namespace + ".deleteMemberPet", m_id);
	}

	@Override
	public List<MemberPetDTO> selectMemberPetList(int m_id) {
		return sqlSession.selectList(namespace + ".selectMemberPetList", m_id);
	}

}
