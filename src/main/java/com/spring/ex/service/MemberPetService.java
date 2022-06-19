package com.spring.ex.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.ex.dto.MemberPetDTO;

@Service
public interface MemberPetService {
	public int insertMemberPet(MemberPetDTO dto);
	public int deleteMemberPet(int m_id);
	public List<MemberPetDTO> selectMemberPetList(int m_id);
	public int updateMemberPet(int m_id, List<MemberPetDTO> memberPetList);
}
