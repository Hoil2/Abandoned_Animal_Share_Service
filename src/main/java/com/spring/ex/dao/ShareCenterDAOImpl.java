package com.spring.ex.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.ex.dto.ShareCenterDTO;
import com.spring.ex.dto.ShelterDTO;


@Repository
public class ShareCenterDAOImpl implements ShareCenterDAO{
	
	@Inject
	private SqlSession sqlSession;
	private static final String namespace = "com.spring.ex.ShareCenterMapper";
	
	//분양센터페이지 유기동물 목록 출력
	@Override
	public List<ShareCenterDTO> getShareCenterBoardPage(HashMap<String, Object> map) throws Exception {
		return sqlSession.selectList(namespace + ".getShareCenterBoardPage", map);
	}

	
	@Override
	public int getShareCenterBoardViewTotalCount(HashMap<String, String> map) throws Exception {
		return sqlSession.selectOne(namespace + ".getShareCenterBoardViewTotalCount", map);
	}

	// 공공데이터 유기동물 API DB에 저장
	public void setDbShareCenterApiResponse(Map<String, Object> map) throws Exception {
		sqlSession.insert(namespace + ".setDbShareCenterApiResponse", map);
	}
	
	//유기동물 DB에서 존재하는 목록만 셀렉트 박스에 출력
	@Override
	public List<String> getShareCenterAreaList() throws Exception {
		return sqlSession.selectList(namespace + ".getShareCenterAreaList"); 
	}
	
	//유기동물 게시글 상세페이지 출력 
	@Override
	public Map<String, Object> getShareCenterBoardReadPage(String desertion_no) throws Exception {
		return sqlSession.selectOne(namespace + ".getShareCenterBoardReadPage", desertion_no);
	}
	
	//유기동물 센터 게시물 조회수 증가
	@Override
	public void addShareCenterBoardReadPageHit(String desertion_no) throws Exception {
		sqlSession.update(namespace + ".addShareCenterBoardReadPageHit", desertion_no);
	}
	
	//유기동물 센터 해당 게시물 좋아요 유무 체크
	@Override
	public int getGoodCheckShareCenterBoardReadPage(HashMap<String, Object> map) throws Exception {
		return sqlSession.selectOne(namespace + ".getGoodCheckShareCenterBoardReadPage", map);
	}
	
	//유기동물 센터 해당 게시물 좋아요 추가
	@Override
	public int addGoodShareCenterReadPage(HashMap<String, Object> map) throws Exception {
		return sqlSession.insert(namespace + ".addGoodShareCenterReadPage", map);
	}
	
	//유기동물 센터 해당 게시물 좋아요 삭제
	@Override
	public int subtractGoodShareCenterReadPage(HashMap<String, Object> map) throws Exception {
		return sqlSession.delete(namespace + ".subtractGoodShareCenterReadPage", map);
	}
	
	//기 등록된 보호소인지 체크
	public int isCheckCareShelter(HashMap<String, Object> map) throws Exception {
		return sqlSession.selectOne(namespace + ".isCheckCareShelter", map);
	}
	
	//보호소 등록안된 보호소라면 추가
	public int setCareShelter(ShelterDTO dto) throws Exception {
		return sqlSession.insert(namespace + ".setCareShelter", dto);
	}
}