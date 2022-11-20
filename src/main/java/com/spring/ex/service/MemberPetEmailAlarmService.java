package com.spring.ex.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.ex.dto.MemberPetEmailAlarmDTO;

@Service
public interface MemberPetEmailAlarmService {
	public int insertMemberPetEmailAlarm(MemberPetEmailAlarmDTO dto);
	public int updateMemberPetEmailAlarm(MemberPetEmailAlarmDTO dto);
	public int deleteMemberPetEmailAlarm(int mpea_id);
	public List<MemberPetEmailAlarmDTO> getMemberPetEmailAlarmList(int m_id);
	public List<MemberPetEmailAlarmDTO> getMemberPetEmailAlarmListByMp_id(int mp_id);
	public MemberPetEmailAlarmDTO getMemberPetEmailAlarm(int mpea_id);
	public MemberPetEmailAlarmDTO getMemberPetEmailAlarmByM_idAndMp_id(int m_id, int mp_id);
}
