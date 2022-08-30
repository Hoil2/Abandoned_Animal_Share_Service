package com.spring.ex.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.ex.dto.ShelterDTO;

@Service
public interface ShelterService {
	public List<ShelterDTO> selectAllShelterList();
	public List<HashMap> getShareCenterBoardPageByAddress(HashMap<String, Object> map);
	public int getShareCenterBoardViewTotalCountByAddress(HashMap<String, Object> map);
}