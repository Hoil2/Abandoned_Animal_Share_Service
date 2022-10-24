package com.spring.ex.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.spring.ex.dto.ShelterDTO;

@Repository
public interface ShelterDAO {
	public List<ShelterDTO> selectAllShelterList();
	public List<HashMap> getShareCenterBoardPageByAddress(HashMap<String, Object> map);
	public int getShareCenterBoardViewTotalCountByAddress(HashMap<String, Object> map);
	public ShelterDTO selectShelterByAas_id(int aas_id);
}
