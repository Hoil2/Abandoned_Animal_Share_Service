package com.spring.ex.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.ex.dto.EmailAlarmConditionDTO;

@Repository
public class EmailAlarmConditionDAOImpl implements EmailAlarmConditionDAO {

	@Inject
	private SqlSession sql;
	
	private String namespace = "com.spring.ex.EmailAlarmConditionMapper";
	
	@Override
	public EmailAlarmConditionDTO getEmailAlarmCondition(int m_id) {
		return sql.selectOne(namespace + ".getEmailAlarmCondition", m_id);
	}

	@Override
	public List<EmailAlarmConditionDTO> getEmailAlarmConditionList() {
		return sql.selectList(namespace + ".getEmailAlarmConditionList");
	}
	
	@Override
	public int insertEmailAlarmCondition(EmailAlarmConditionDTO dto) {
		return sql.insert(namespace + ".insertEmailAlarmCondition", dto);
	}

	@Override
	public int updateEmailAlarmCondition(EmailAlarmConditionDTO dto) {
		return sql.update(namespace + ".updateEmailAlarmCondition", dto);
	}

	@Override
	public int deleteEmailAlarmCondition(int m_id) {
		return sql.delete(namespace + ".deleteEmailAlarmCondition", m_id);
	}
}
