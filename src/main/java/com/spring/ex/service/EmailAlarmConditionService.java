package com.spring.ex.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.ex.dto.EmailAlarmConditionDTO;

@Service
public interface EmailAlarmConditionService {
	public EmailAlarmConditionDTO getEmailAlarmCondition(int m_id);
	public List<EmailAlarmConditionDTO> getEmailAlarmConditionList();
	public int insertEmailAlarmCondition(EmailAlarmConditionDTO dto);
	public int updateEmailAlarmCondition(EmailAlarmConditionDTO dto);
	public int deleteEmailAlarmCondition(int m_id);
}
