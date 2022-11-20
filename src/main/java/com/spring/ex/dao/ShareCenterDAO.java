package com.spring.ex.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.spring.ex.dto.ShareCenterDTO;
import com.spring.ex.dto.ShelterDTO;


@Repository
public interface ShareCenterDAO {
	//분양센터 게시판 최신순 출력
	public List<ShareCenterDTO> getShareCenterBoardPage(HashMap<String, Object> map) throws Exception;
	
	//분양센터페이지 유기동물 목록 총 갯수 - 페이징
	public int getShareCenterBoardViewTotalCount(HashMap<String, Object> map) throws Exception;
	
	// 공공데이터 유기동물 API DB에 저장
	public int setDbShareCenterApiResponse(Map<String, Object> map) throws Exception;
	
	//유기동물 DB에서 존재하는 목록만 셀렉트 박스에 출력
	public List<String> getShareCenterAreaList() throws Exception;

	//유기동물 게시글 상세페이지 출력 
	public Map<String, Object> getShareCenterBoardReadPage(String desertion_no) throws Exception;
	
	//유기동물 센터 게시물 조회수 증가
	public void addShareCenterBoardReadPageHit(String desertion_no) throws Exception;
	
	//유기동물 센터 해당 게시물 좋아요 유무 체크
	public int getGoodCheckShareCenterBoardReadPage(HashMap<String, Object> map) throws Exception;
	
	//유기동물 센터 해당 게시물 좋아요 추가
	public int addGoodShareCenterReadPage(HashMap<String, Object> map) throws Exception;
	
	//유기동물 센터 해당 게시물 좋아요 삭제
	public int subtractGoodShareCenterReadPage(HashMap<String, Object> map) throws Exception;
	
	//기 등록된 보호소인지 체크
	public int isCheckCareShelter(HashMap<String, Object> map) throws Exception;
	
	//보호소 등록안된 보호소라면 추가
	public int setCareShelter(ShelterDTO dto) throws Exception;
	
	//2022-10-17 김홍일 / 현재 db에 저장된 동물의 품종 리스트 가져오기
	public List<String> getAnimalBreedList(String kind);
}