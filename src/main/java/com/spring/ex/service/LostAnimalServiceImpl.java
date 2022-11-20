package com.spring.ex.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.ex.dao.LostAnimalDAO;
import com.spring.ex.dto.LostAnimalDTO;

@Service
public class LostAnimalServiceImpl implements LostAnimalService{
	
	@Inject
	private LostAnimalDAO dao;
	
	//실종 게시판 출력
	@Override
	public List<LostAnimalDTO> getLostAnimalBoardList(HashMap<String, Object> map) throws Exception {
		return dao.getLostAnimalBoardList(map);
	}
	//실종 게시판 총개수 - 페이징 
	@Override
	public int getTotalCountLostAnimalBoardList(HashMap<String, Object> map) throws Exception {
		return dao.getTotalCountLostAnimalBoardList(map);
	}
	//실종 게시판 글작성
	@Override
	public int writeLostAnimalBoard(LostAnimalDTO dto) throws Exception {
		return dao.writeLostAnimalBoard(dto);
	}
	//실종 게시판 글삭제
	@Override
	public int deleteLostAnimalBoard(int alb_id) throws Exception {
		return dao.deleteLostAnimalBoard(alb_id);
	}
	//실종 게시판 상세페이지
	@Override
	public Map<String, Object> getReadLostAnimal(int alb_id) throws Exception {
		return dao.getReadLostAnimal(alb_id);
	}
	
	//실종 동물의 품종 겹치지 않게 가져오기
	@Override
	public List<String> getKindListWithDistinct() {
		return dao.getKindListWithDistinct();
	}
	
	//실종 동물 게시판 게시여부 변경
	@Override
	public int modifyEnableLostAnimal(HashMap<String, Object> map) throws Exception {
		return dao.modifyEnableLostAnimal(map);
	}
	//실동 게시글 수정
	@Override
	public int modifyLostAnimalBoard(LostAnimalDTO dto) throws Exception {
		return dao.modifyLostAnimalBoard(dto);
	}
}