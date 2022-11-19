package com.spring.ex.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.ex.dto.MemberPetEmailAlarmDTO;

@Repository
public class MemberPetEmailAlarmDAOImpl implements MemberPetEmailAlarmDAO {

	@Inject
	private SqlSession sql;
	
	private final String namespace = "com.spring.ex.MemberPetEmailAlarmMapper";

	@Override
	public int insertMemberPetEmailAlarm(MemberPetEmailAlarmDTO dto) {
		return sql.insert(namespace + ".insertMemberPetEmailAlarm", dto);
	}

	@Override
	public int updateMemberPetEmailAlarm(MemberPetEmailAlarmDTO dto) {
		return sql.update(namespace + ".updateMemberPetEmailAlarm", dto);
	}

	@Override
	public int deleteMemberPetEmailAlarm(int mpea_id) {
		return sql.delete(namespace + ".deleteMemberPetEmailAlarm", mpea_id);
	}

	@Override
	public List<MemberPetEmailAlarmDTO> getMemberPetEmailAlarmList(int m_id) {
		return sql.selectList(namespace + ".getMemberPetEmailAlarmList", m_id);
	}

	@Override
	public MemberPetEmailAlarmDTO getMemberPetEmailAlarm(int mpea_id) {
		return sql.selectOne(namespace + ".getMemberPetEmailAlarm", mpea_id);
	}
}
