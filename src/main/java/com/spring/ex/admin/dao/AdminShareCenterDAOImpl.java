package com.spring.ex.admin.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.ex.dto.ShareCenterDTO;

@Repository
public class AdminShareCenterDAOImpl implements AdminShareCenterDAO {

	@Inject SqlSession sqlSession;
	private static final String namespace = "com.spring.ex.AdminShareCenterMapper";
	
	/*
	 *오늘 공고된 유기동물 수
	 *3일 이내 종료되는 유기동물 수
	 *보호소 수
	 *api 갱신 일, 시간
	 *보호중인 유기동물 수
	 *2주내 입양된 유기동물 수
	 *2주내 반환된 유기동물 수
	 *2주내 사망한 유기동물 수
	 * */
	public int getTodayRegistrationCount() throws Exception {
		return sqlSession.selectOne(namespace + ".getTodayRegistrationCount");
	}
	public int getAnimalDeadlineCount() throws Exception {
		return sqlSession.selectOne(namespace + ".getAnimalDeadlineCount");
	}
	public int getShelterCount() throws Exception {
		return sqlSession.selectOne(namespace + ".getShelterCount");
	}
	public Object getApiRenewalDate() throws Exception {
		return sqlSession.selectOne(namespace + ".getApiRenewalDate");
	}
	public int getAnimalProtectCount() throws Exception {
		return sqlSession.selectOne(namespace + ".getAnimalProtectCount");
	}
	public int getAnimalAdoptionCount() throws Exception {
		return sqlSession.selectOne(namespace + ".getAnimalAdoptionCount");
	}
	public int getAnimalReturnCount() throws Exception {
		return sqlSession.selectOne(namespace + ".getAnimalReturnCount");
	}
	public int getAnimalDeathCount() throws Exception {
		return sqlSession.selectOne(namespace + ".getAnimalDeathCount");
	}
	
	// 2022-11-21 / 김홍일
	// happen_dt가 오늘인 유기동물 정보 리스트 가져오기
	@Override
	public List<ShareCenterDTO> getTodayInsertedAbandonedAnimals() {
		return sqlSession.selectList(namespace + ".getTodayInsertedAbandonedAnimals");
	}
	
	@Override
	public int updateAbandonedAnimalInfo(ShareCenterDTO dto) throws Exception {
		return sqlSession.update(namespace + ".updateAbandonedAnimalInfo", dto);
	}
}