package com.spring.ex.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.ex.dao.MemberPetDAO;
import com.spring.ex.dto.MemberPetDTO;

@Service
public class MemberPetServiceImpl implements MemberPetService {

	@Inject
	private MemberPetDAO memberPetDAO;
	
	@Override
	public int insertMemberPet(MemberPetDTO dto) {
		return memberPetDAO.insertMemberPet(dto);
	}

	@Override
	public int deleteMemberPet(int mp_id) {
		return memberPetDAO.deleteMemberPet(mp_id);
	}

	@Override
	public int updateMemberPet(MemberPetDTO dto) {
		return memberPetDAO.updateMemberPet(dto);
	}
	
	@Override
	public List<MemberPetDTO> selectMemberPetList(int m_id) {
		return memberPetDAO.selectMemberPetList(m_id);
	}

	@Override
	public MemberPetDTO getMemberPet(int mp_id) {
		return memberPetDAO.getMemberPet(mp_id);
	}
}
