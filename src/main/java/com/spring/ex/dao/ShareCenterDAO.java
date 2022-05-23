package com.spring.ex.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.spring.ex.dto.ShareCenterDTO;


@Repository
public interface ShareCenterDAO {
	//분양센터 게시판 최신순 출력
	public List<ShareCenterDTO> getShareCenterBoardPage(HashMap<String, Object> map) throws Exception;
	
	//분양센터페이지 유기동물 목록 총 갯수 - 페이징
	public int getShareCenterBoardViewTotalCount(HashMap<String, String> map) throws Exception;
	
	// 공공데이터 유기동물 API DB에 저장
	public void setDbShareCenterApiResponse(ShareCenterDTO dto) throws Exception;
	
	//유기동물 DB에서 존재하는 목록만 셀렉트 박스에 출력
	public List<String> getShareCenterAreaList() throws Exception;

}