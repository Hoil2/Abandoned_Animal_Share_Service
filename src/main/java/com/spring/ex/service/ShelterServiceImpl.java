package com.spring.ex.service;

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

}
