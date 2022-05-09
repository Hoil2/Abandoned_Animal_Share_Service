package com.spring.ex.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.spring.ex.dto.ShareCenterDTO;


@Repository
public interface ShareCenterDAO {
	//분양센터페이지 유기동물 목록 출력
	public List<ShareCenterDTO> getShareCenterBoardPage(HashMap<String, Integer> map) throws Exception;
	
	//분양센터페이지 유기동물 목록 총 갯수 - 페이징
	public int getShareCenterBoardViewTotalCount() throws Exception;
	
	// 공공데이터 유기동물 API DB에 저장
	public void setDbShareCenterApiResponse(ShareCenterDTO dto) throws Exception;

}