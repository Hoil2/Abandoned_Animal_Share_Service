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
	public int deleteMemberPet(int m_id) {
		return memberPetDAO.deleteMemberPet(m_id);
	}

	@Override
	public List<MemberPetDTO> selectMemberPetList(int m_id) {
		return memberPetDAO.selectMemberPetList(m_id);
	}

	@Override
	public MemberPetDTO getMemberPet(int mp_id) {
		return memberPetDAO.getMemberPet(mp_id);
	}
	
	@Override
	public int updateMemberPet(int m_id, List<MemberPetDTO> memberPetList) {
		try {
			memberPetDAO.deleteMemberPet(m_id);
			for(MemberPetDTO mp : memberPetList) {
				memberPetDAO.insertMemberPet(mp);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			return 0;
		}
		return 1;
	}
}
