package com.spring.ex.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.ex.dao.ShareCenterDAO;
import com.spring.ex.dto.ShareCenterDTO;

@Service
public class ShareCenterServiceImpl implements ShareCenterService{
	
	@Inject
	private ShareCenterDAO dao;
	
	//분양센터페이지 유기동물 목록 출력
	public List<ShareCenterDTO> getShareCenterBoardPage(HashMap<String, Integer> map) throws Exception {
		return dao.getShareCenterBoardPage(map);
	}
	
	//분양센터페이지 유기동물 목록 총 갯수 - 페이징
	public int getShareCenterBoardViewTotalCount() throws Exception {
		return dao.getShareCenterBoardViewTotalCount();
	}
}