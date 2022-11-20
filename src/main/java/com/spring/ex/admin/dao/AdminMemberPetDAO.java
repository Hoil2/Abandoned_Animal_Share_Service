package com.spring.ex.admin.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.spring.ex.dto.MemberPetDTO;

@Repository
public interface AdminMemberPetDAO {
	public List<MemberPetDTO> getAdminMemberPetBoard(int m_id, int nowPage, int pageSize);
	public int getAdminMemberPetPostTotalCount(int m_id);
}
