package com.spring.ex.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.spring.ex.dto.LostAnimalDTO;

@Repository
public interface LostAnimalDAO {
	//실종 게시판 출력
	public List<LostAnimalDTO> getLostAnimalBoardList(HashMap<String, Object> map) throws Exception;
	//실종 게시판 총개수 - 페이징 
	public int getTotalCountLostAnimalBoardList(HashMap<String, Object> map) throws Exception;
	//실종 게시판 글작성
	public int writeLostAnimalBoard(LostAnimalDTO dto) throws Exception;
	//실종 게시판 글삭제
	public int deleteLostAnimalBoard(int alb_id) throws Exception;
	//실종 게시판 상세페이지
	public Map<String, Object> getReadLostAnimal(int alb_id) throws Exception;
}