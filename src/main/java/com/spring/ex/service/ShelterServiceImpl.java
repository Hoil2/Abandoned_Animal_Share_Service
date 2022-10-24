package com.spring.ex.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.ex.dao.ShelterDAO;
import com.spring.ex.dto.ShelterDTO;

@Service
public class ShelterServiceImpl implements ShelterService {
	
	@Inject
	private ShelterDAO shelterDAO;
	
	@Override
	public List<ShelterDTO> selectAllShelterList() {
		return shelterDAO.selectAllShelterList();
	}

	@Override
	public List<HashMap> getShareCenterBoardPageByAddress(HashMap<String, Object> map) {
		return shelterDAO.getShareCenterBoardPageByAddress(map);
	}

	@Override
	public int getShareCenterBoardViewTotalCountByAddress(HashMap<String, Object> map) {
		return shelterDAO.getShareCenterBoardViewTotalCountByAddress(map);
	}

	@Override
	public ShelterDTO getShelterByAas_id(int aas_id) {
		return shelterDAO.selectShelterByAas_id(aas_id);
	}

}
