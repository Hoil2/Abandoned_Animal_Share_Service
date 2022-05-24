package com.spring.ex.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.ex.dto.ShareCenterDTO;


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
	public void setDbShareCenterApiResponse(ShareCenterDTO dto) throws Exception {
		sqlSession.insert(namespace + ".setDbShareCenterApiResponse", dto);
	}
	
	//유기동물 DB에서 존재하는 목록만 셀렉트 박스에 출력
	@Override
	public List<String> getShareCenterAreaList() throws Exception {
		return sqlSession.selectList(namespace + ".getShareCenterAreaList"); 
	}
	
	//유기동물 게시글 상세페이지 출력 
	@Override
	public ShareCenterDTO getShareCenterBoardReadPage(String desertion_no) throws Exception {
		return sqlSession.selectOne(namespace + ".getShareCenterBoardReadPage", desertion_no);
	}
}