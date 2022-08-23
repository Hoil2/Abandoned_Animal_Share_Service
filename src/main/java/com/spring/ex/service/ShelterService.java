package com.spring.ex.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.ex.dto.ShelterDTO;

@Service
public interface ShelterService {
	public List<ShelterDTO> selectAllShelterList();
}