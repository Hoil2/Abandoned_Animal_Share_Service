package com.spring.ex.admin.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.ex.dto.MemberPetDTO;

@Service
public interface AdminMemberPetService {
	public List<MemberPetDTO> getAdminMemberPetBoard(int m_id, int nowPage, int pageSize);
	public int getAdminMemberPetPostTotalCount(int m_id);
}
