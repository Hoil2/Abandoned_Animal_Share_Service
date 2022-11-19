package com.spring.ex.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.ex.dao.MemberPetEmailAlarmDAO;
import com.spring.ex.dto.MemberPetEmailAlarmDTO;

@Service
public class MemberPetEmailAlarmServiceImpl implements MemberPetEmailAlarmService {

	@Inject
	private MemberPetEmailAlarmDAO memberPetEmailAlarmDAO;

	@Override
	public int insertMemberPetEmailAlarm(MemberPetEmailAlarmDTO dto) {
		return memberPetEmailAlarmDAO.insertMemberPetEmailAlarm(dto);
	}

	@Override
	public int updateMemberPetEmailAlarm(MemberPetEmailAlarmDTO dto) {
		return memberPetEmailAlarmDAO.updateMemberPetEmailAlarm(dto);
	}

	@Override
	public int deleteMemberPetEmailAlarm(int mpea_id) {
		return memberPetEmailAlarmDAO.deleteMemberPetEmailAlarm(mpea_id);
	}

	@Override
	public List<MemberPetEmailAlarmDTO> getMemberPetEmailAlarmList(int m_id) {
		return memberPetEmailAlarmDAO.getMemberPetEmailAlarmList(m_id);
	}

	@Override
	public MemberPetEmailAlarmDTO getMemberPetEmailAlarm(int mpea_id) {
		return memberPetEmailAlarmDAO.getMemberPetEmailAlarm(mpea_id);
	}
}
