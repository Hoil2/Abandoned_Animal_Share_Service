package com.spring.ex.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.ex.dao.EmailAlarmConditionDAO;
import com.spring.ex.dto.EmailAlarmConditionDTO;

@Service
public class EmailAlarmConditionServiceImpl implements EmailAlarmConditionService {

	@Inject
	private EmailAlarmConditionDAO emailAlarmConditionDAO; 
	
	@Override
	public EmailAlarmConditionDTO getEmailAlarmCondition(int m_id) {
		return emailAlarmConditionDAO.getEmailAlarmCondition(m_id);
	}

	@Override
	public int insertEmailAlarmCondition(EmailAlarmConditionDTO dto) {
		return emailAlarmConditionDAO.insertEmailAlarmCondition(dto);
	}

	@Override
	public int updateEmailAlarmCondition(EmailAlarmConditionDTO dto) {
		return emailAlarmConditionDAO.updateEmailAlarmCondition(dto);
	}

	@Override
	public int deleteEmailAlarmCondition(int m_id) {
		return emailAlarmConditionDAO.deleteEmailAlarmCondition(m_id);
	}
	
}
