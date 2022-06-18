package com.spring.ex.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.spring.ex.dto.CommunityDTO;
import com.spring.ex.dto.ShareCenterDTO;


@Repository
public interface MainPageDAO {
	public List<ShareCenterDTO> getPopularityShareCenterList() throws Exception;
	public List<CommunityDTO> getPopularityDailyCommunityBoardList(int classify) throws Exception;
}