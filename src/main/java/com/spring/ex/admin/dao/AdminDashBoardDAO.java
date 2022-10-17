package com.spring.ex.admin.dao;

import org.springframework.stereotype.Repository;

@Repository
public interface AdminDashBoardDAO {
	
	//오늘의 가입 회원 수
	public int getTodayRegisterMemberTotalCount() throws Exception;
	
	//오늘의 게시글 작성 수
	public int getTodayBoardWriteTotalCount() throws Exception;
	
	//오늘의 등록된 유기동물 수
	public int getTodayAbandonedAnimalTotalCount() throws Exception;
	
	//현재 보호중인 유기동물 수
	public int getTodayProtectAbandonedAnimalTotalCount() throws Exception;
}