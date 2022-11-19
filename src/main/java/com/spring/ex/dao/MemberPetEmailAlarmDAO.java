package com.spring.ex.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.spring.ex.dto.MemberPetEmailAlarmDTO;

@Repository
public interface MemberPetEmailAlarmDAO {
	public int insertMemberPetEmailAlarm(MemberPetEmailAlarmDTO dto);
	public int updateMemberPetEmailAlarm(MemberPetEmailAlarmDTO dto);
	public int deleteMemberPetEmailAlarm(int mpea_id);
	public List<MemberPetEmailAlarmDTO> getMemberPetEmailAlarmList(int m_id);
	public MemberPetEmailAlarmDTO getMemberPetEmailAlarm(int mpea_id);
}
