package com.spring.ex.service;

import org.springframework.stereotype.Service;

import com.spring.ex.dto.EmailAlarmConditionDTO;

@Service
public interface EmailAlarmConditionService {
	public EmailAlarmConditionDTO getEmailAlarmCondition(int m_id);
	public int insertEmailAlarmCondition(EmailAlarmConditionDTO dto);
	public int updateEmailAlarmCondition(EmailAlarmConditionDTO dto);
	public int deleteEmailAlarmCondition(int m_id);
}
