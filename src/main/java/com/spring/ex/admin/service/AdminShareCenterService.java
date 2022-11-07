package com.spring.ex.admin.service;

import org.springframework.stereotype.Service;

@Service
public interface AdminShareCenterService {
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
	public int getTodayRegistrationCount() throws Exception;
	public int getAnimalDeadlineCount() throws Exception;
	public int getShelterCount() throws Exception;
	public Object getApiRenewalDate() throws Exception;
	public int getAnimalProtectCount() throws Exception;
	public int getAnimalAdoptionCount() throws Exception;
	public int getAnimalReturnCount() throws Exception;
	public int getAnimalDeathCount() throws Exception;
}