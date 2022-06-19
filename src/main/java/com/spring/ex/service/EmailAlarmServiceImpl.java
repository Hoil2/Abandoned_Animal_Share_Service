package com.spring.ex.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.ex.dao.EmailAlarmDAO;
import com.spring.ex.dto.EmailAlarmDTO;

@Service
public class EmailAlarmServiceImpl implements EmailAlarmService {

	@Inject
	private EmailAlarmDAO emailAlarmDAO;
	
	@Override
	public int insertEmailAlarm(EmailAlarmDTO dto) {
		return emailAlarmDAO.insertEmailAlarm(dto);
	}

	@Override
	public int deleteEmailAlarm(EmailAlarmDTO dto) {
		return emailAlarmDAO.deleteEmailAlarm(dto);
	}
	
	@Override
	public int deleteEmailAlarmByM_id(int m_id) {
		return emailAlarmDAO.deleteEmailAlarmByM_id(m_id);
	}

	@Override
	public int existEmailAlarm(EmailAlarmDTO dto) {
		return emailAlarmDAO.existEmailAlarm(dto);
	}

	@Override
	public List<EmailAlarmDTO> getEmailAlarmList(String desertion_no) {
		return emailAlarmDAO.getEmailAlarmList(desertion_no);
	}

	@Override
	public List<EmailAlarmDTO> getEmailAlarmListByM_id(int m_id) {
		return emailAlarmDAO.getEmailAlarmListByM_id(m_id);
	}

	@Override
	public int updateEmailAlarm(int m_id, List<EmailAlarmDTO> emailAlarmList) {
		try {
			emailAlarmDAO.deleteEmailAlarmByM_id(m_id);
			for(EmailAlarmDTO ea : emailAlarmList) {
				emailAlarmDAO.insertEmailAlarm(ea);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			return 0;
		}
		return 1;
	}
}
