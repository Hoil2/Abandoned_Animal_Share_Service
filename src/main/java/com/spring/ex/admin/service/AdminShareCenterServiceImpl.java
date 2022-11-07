package com.spring.ex.admin.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.ex.admin.dao.AdminDashBoardDAO;
import com.spring.ex.admin.dao.AdminShareCenterDAO;

@Service
public class AdminShareCenterServiceImpl implements AdminShareCenterService {

	@Inject AdminShareCenterDAO dao;

	//오늘 공고된 유기동물 수
	@Override
	public int getTodayRegistrationCount() throws Exception {
		return dao.getTodayRegistrationCount();
	}
	//3일 이내 종료되는 유기동물 수
	@Override
	public int getAnimalDeadlineCount() throws Exception {
		return dao.getAnimalDeadlineCount();
	}
	//보호소 수
	@Override
	public int getShelterCount() throws Exception {
		return dao.getShelterCount();
	}	
	//api 갱신 일, 시간
	@Override
	public Object getApiRenewalDate() throws Exception {
		return dao.getApiRenewalDate();
	}
	//보호중인 유기동물 수
	@Override
	public int getAnimalProtectCount() throws Exception {
		return dao.getAnimalProtectCount();
	}
	//2주내 입양된 유기동물 수
	@Override
	public int getAnimalAdoptionCount() throws Exception {
		return dao.getAnimalAdoptionCount();
	}
	//2주내 반환된 유기동물 수
	@Override
	public int getAnimalReturnCount() throws Exception {
		return dao.getAnimalReturnCount();
	}
	//2주내 사망한 유기동물 수
	@Override
	public int getAnimalDeathCount() throws Exception {
		return dao.getAnimalDeathCount();
	}
	
}