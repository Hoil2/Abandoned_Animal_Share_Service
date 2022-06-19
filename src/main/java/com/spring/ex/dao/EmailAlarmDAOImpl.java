package com.spring.ex.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.ex.dto.EmailAlarmDTO;

@Repository
public class EmailAlarmDAOImpl implements EmailAlarmDAO {

	@Inject
	private SqlSession sqlSession;
	
	private final String namespace = "com.spring.ex.EmailAlarmMapper";
	
	@Override
	public int insertEmailAlarm(EmailAlarmDTO dto) {
		return sqlSession.insert(namespace + ".insertEmailAlarm", dto);
	}

	@Override
	public int deleteEmailAlarm(EmailAlarmDTO dto) {
		return sqlSession.delete(namespace + ".deleteEmailAlarm", dto);
	}

	@Override
	public int deleteEmailAlarmByM_id(int m_id) {
		return sqlSession.delete(namespace + ".deleteEmailAlarmByM_id", m_id);
	}
	
	@Override
	public int existEmailAlarm(EmailAlarmDTO dto) {
		return sqlSession.selectOne(namespace + ".existEmailAlarm", dto);
	}

	@Override
	public List<EmailAlarmDTO> getEmailAlarmList(String desertion_no) {
		return sqlSession.selectList(namespace + ".getEmailAlarmList", desertion_no);
	}

	@Override
	public List<EmailAlarmDTO> getEmailAlarmListByM_id(int m_id) {
		return sqlSession.selectList(namespace + ".getEmailAlarmListByM_id", m_id);
	}
}
