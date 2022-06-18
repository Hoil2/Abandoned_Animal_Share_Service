package com.spring.ex.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.ex.dto.CommunityDTO;
import com.spring.ex.dto.ShareCenterDTO;

@Service
public interface MainPageService {
	public List<ShareCenterDTO> getPopularityShareCenterList() throws Exception;
	public List<CommunityDTO> getPopularityDailyCommunityBoardList(int classify) throws Exception;
}