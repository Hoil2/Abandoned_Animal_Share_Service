package com.spring.ex.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.spring.ex.dto.ShelterDTO;

@Repository
public interface ShelterDAO {
	public List<ShelterDTO> selectAllShelterList();
}
