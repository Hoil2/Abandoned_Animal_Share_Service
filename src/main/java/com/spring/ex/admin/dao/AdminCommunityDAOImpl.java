package com.spring.ex.admin.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class AdminCommunityDAOImpl implements AdminCommunityDAO {
	
	@Inject
	private SqlSession sql;
	
	private final String namespace = "com.spring.ex.AdminCommunityMapper";

	// 커뮤니티 게시물 리스트 가져오기
	@Override
	public List<Map<String, Object>> getAdminBoardPage(String search, String filter, int classify, int nowPage, int pageSize) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("filter", filter);
		map.put("classify", classify);
		map.put("nowPage", nowPage);
		map.put("pageSize", pageSize);
		return sql.selectList(namespace + ".getAdminBoardPage", map);
	}

	// 커뮤니티 게시물 리스트 개수 가져오기	
	@Override
	public int getAdminBoardPageCount(String search, String filter, int classify) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("filter", filter);
		map.put("classify", classify);
		return sql.selectOne(namespace + ".getAdminBoardPageCount", map);
	}

	// 7일간 게시물 등록 개수 가져오기
	@Override
	public List<Map<String, Object>> getPostCountBy7Day() {
		return sql.selectList(namespace + ".getPostCountBy7Day");
	}

	// 7일간 특정 게시판의 게시물 등록 개수 가져오기
	@Override
	public List<Map<String, Object>> getPostCountBy7Day(int classify) {
		return sql.selectList(namespace + ".getPostCountByClassifyAnd7Day", classify);
	}

	// 오늘의 게시물 등록 개수 가져오기
	@Override
	public int getPostCountOfToday() {
		return sql.selectOne(namespace + ".getPostCountOfToday");
	}

	// 오늘의 특정 게시판의 게시물 등록 개수 가져오기
	@Override
	public int getPostCountOfToday(int classify) {
		return sql.selectOne(namespace + ".getPostCountOfTodayByClassify", classify);
	}

	@Override
	public List<Map<String, Object>> getAdminMemberBoard(int m_id, int nowPage, int pageSize) {
		Map<String , Object> map = new HashMap<String, Object>();
		map.put("m_id", m_id);
		map.put("nowPage", nowPage);
		map.put("pageSize", pageSize);
		
		return sql.selectList(namespace + ".getAdminMemberBoard", map);
	}

	@Override
	public int getAdminMemberPostTotalCount(int m_id) {
		Map<String , Object> map = new HashMap<String, Object>();
		map.put("m_id", m_id);
		
		return sql.selectOne(namespace + ".getAdminMemberPostTotalCount", map);
	}

}
