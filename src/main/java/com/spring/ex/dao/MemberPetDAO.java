package com.spring.ex.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.spring.ex.dto.MemberPetDTO;

@Repository
public interface MemberPetDAO {
	public int insertMemberPet(MemberPetDTO dto);
	public int deleteMemberPet(int mp_id);
	public int updateMemberPet(MemberPetDTO dto);
	public List<MemberPetDTO> selectMemberPetList(int m_id);
	public MemberPetDTO getMemberPet(int mp_id);
}
