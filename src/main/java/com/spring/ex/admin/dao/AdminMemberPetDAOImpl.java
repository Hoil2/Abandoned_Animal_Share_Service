package com.spring.ex.admin.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.ex.dto.MemberPetDTO;

@Repository
public class AdminMemberPetDAOImpl implements AdminMemberPetDAO {

	@Inject
	private SqlSession sql;
	
	private final String namespace = "com.spring.ex.AdminMemberPetMapper"; 
	
	@Override
	public List<MemberPetDTO> getAdminMemberPetBoard(int m_id, int nowPage, int pageSize) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("m_id", m_id);
		map.put("nowPage", nowPage);
		map.put("pageSize", pageSize);
		
		return sql.selectList(namespace + ".getAdminMemberPetBoard", map);
	}

	@Override
	public int getAdminMemberPetPostTotalCount(int m_id) {
		return sql.selectOne(namespace + ".getAdminMemberPetPostTotalCount", m_id);
	}
}
