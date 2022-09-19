package com.spring.ex.dao;

import org.springframework.stereotype.Repository;

import com.spring.ex.dto.EmailAlarmConditionDTO;

@Repository
public interface EmailAlarmConditionDAO {
	public EmailAlarmConditionDTO getEmailAlarmCondition(int m_id);
	public int insertEmailAlarmCondition(EmailAlarmConditionDTO dto);
	public int updateEmailAlarmCondition(EmailAlarmConditionDTO dto);
	public int deleteEmailAlarmCondition(int m_id);
}
