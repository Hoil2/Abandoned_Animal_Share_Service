package com.spring.ex.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.ex.dao.MainPageDAO;
import com.spring.ex.dto.CommunityDTO;
import com.spring.ex.dto.LostAnimalDTO;
import com.spring.ex.dto.ShareCenterDTO;

@Service
public class MainPageServiceImpl implements MainPageService{
	
	@Inject
	private MainPageDAO dao;
	@Override
	public List<ShareCenterDTO> getPopularityShareCenterList() throws Exception {
		return dao.getPopularityShareCenterList();
	}
	
	@Override
	public List<CommunityDTO> getPopularityDailyCommunityBoardList(int classify) throws Exception {
		return dao.getPopularityDailyCommunityBoardList(classify);
	}
	
	@Override
	public List<LostAnimalDTO> getMainPageLostAnimalBoardList() throws Exception {
		return dao.getMainPageLostAnimalBoardList();
	}
}