package com.spring.ex.admin.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.ex.admin.dao.AdminMemberPetDAO;
import com.spring.ex.dto.MemberPetDTO;

@Service
public class AdminMemberPetServiceImpl implements AdminMemberPetService {

	@Inject
	private AdminMemberPetDAO adminMemberPetDAO;
	
	@Override
	public List<MemberPetDTO> getAdminMemberPetBoard(int m_id, int nowPage, int pageSize) {
		return adminMemberPetDAO.getAdminMemberPetBoard(m_id, nowPage, pageSize);
	}

	@Override
	public int getAdminMemberPetPostTotalCount(int m_id) {
		return adminMemberPetDAO.getAdminMemberPetPostTotalCount(m_id);
	}
}
