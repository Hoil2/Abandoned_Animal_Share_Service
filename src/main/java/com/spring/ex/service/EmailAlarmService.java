package com.spring.ex.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.ex.dto.EmailAlarmDTO;

@Service
public interface EmailAlarmService {
	public int insertEmailAlarm(EmailAlarmDTO dto);
	public int deleteEmailAlarm(EmailAlarmDTO dto);
	public int deleteEmailAlarmByM_id(int m_id);
	public int existEmailAlarm(EmailAlarmDTO dto);
	public List<EmailAlarmDTO> getEmailAlarmList(String desertion_no);
	public List<EmailAlarmDTO> getEmailAlarmListByM_id(int m_id);
	public int updateEmailAlarm(int m_id, List<EmailAlarmDTO> emailAlarmList);
}
