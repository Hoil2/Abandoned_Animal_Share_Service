package com.spring.ex.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.ex.dto.ShareCenterDTO;

@Service
public interface ShareCenterService {
	
	//분양센터페이지 유기동물 목록 출력
	public List<ShareCenterDTO> getShareCenterBoardPage(HashMap<String, Integer> map) throws Exception;
	
	//분양센터페이지 유기동물 목록 총 갯수 - 페이징
	public int getShareCenterBoardViewTotalCount() throws Exception;
	
	//공공데이터 api 요청
	public ShareCenterDTO getShareCenterTest() throws Exception;
}