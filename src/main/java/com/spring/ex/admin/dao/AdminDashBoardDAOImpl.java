package com.spring.ex.admin.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDashBoardDAOImpl implements AdminDashBoardDAO {

	@Inject SqlSession sqlSession;
	private static final String namespace = "com.spring.ex.AdminDashBoardMapper";
	
	//오늘의 가입 회원 수
	@Override
	public int getTodayRegisterMemberTotalCount() throws Exception {
		return sqlSession.selectOne(namespace + ".getTodayRegisterMemberTotalCount");
	}
	
	//오늘의 게시글 작성 수
	@Override
	public int getTodayBoardWriteTotalCount() throws Exception {
		return sqlSession.selectOne(namespace + ".getTodayBoardWriteTotalCount");
	}
	
	//오늘의 등록된 유기동물 수
	@Override
	public int getTodayAbandonedAnimalTotalCount() throws Exception {
		return sqlSession.selectOne(namespace + ".getTodayAbandonedAnimalTotalCount");
	}
	
	//현재 보호중인 유기동물 수
	public int getTodayProtectAbandonedAnimalTotalCount() throws Exception {
		return sqlSession.selectOne(namespace + ".getTodayProtectAbandonedAnimalTotalCount");
	}
}