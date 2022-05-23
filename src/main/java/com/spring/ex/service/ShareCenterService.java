package com.spring.ex.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.ex.dto.ShareCenterDTO;

@Service
public interface ShareCenterService {
	
	//분양센터페이지 유기동물 목록 출력
	public List<ShareCenterDTO> getShareCenterBoardPage(HashMap<String, Object> map) throws Exception;
	
	//분양센터페이지 유기동물 목록 총 갯수 - 페이징
	public int getShareCenterBoardViewTotalCount(HashMap<String, String> map) throws Exception;
	
	//공공데이터 api 요청
	public void getShareCenterTest(ShareCenterDTO dto) throws Exception;
	
	//공공데이터 test
	public void getTest() throws Exception;
	
	//유기동물 DB에서 존재하는 목록만 셀렉트 박스에 출력
	public List<String> getShareCenterAreaList() throws Exception;
}