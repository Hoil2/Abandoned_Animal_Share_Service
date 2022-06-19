package com.spring.ex.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.spring.ex.dto.EmailAlarmDTO;

@Repository
public interface EmailAlarmDAO {
	public int insertEmailAlarm(EmailAlarmDTO dto);
	public int deleteEmailAlarm(EmailAlarmDTO dto);
	public int deleteEmailAlarmByM_id(int m_id);
	public int existEmailAlarm(EmailAlarmDTO dto);
	public List<EmailAlarmDTO> getEmailAlarmList(String desertion_no);
	public List<EmailAlarmDTO> getEmailAlarmListByM_id(int m_id);
}
