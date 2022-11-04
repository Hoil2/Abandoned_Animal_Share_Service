package com.spring.ex.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.ex.dto.CommunityDTO;
import com.spring.ex.dto.FileUploadDTO;

@Repository
public class CommunityDAOImpl implements CommunityDAO {
	
	@Inject
	private SqlSession sqlSession;
	private static final String namespace = "com.spring.ex.CommunityMapper";
	
	@Override
	public List<HashMap<String, Object>> getBoardPage(HashMap<String, Object> map) throws Exception {
		return sqlSession.selectList(namespace + ".getBoardPage", map);
	}
	
	@Override
	public int getCommunityBoardPostTotalCount(HashMap<String, Object> map) throws Exception {
		return sqlSession.selectOne(namespace + ".getCommunityBoardPostTotalCount", map);
	}
	
	@Override
	public CommunityDTO getPageDetail(int pageNo) {
		return sqlSession.selectOne(namespace + ".getPageDetail", pageNo);
	}
	
	@Override
	public int insertPost(CommunityDTO dto) {
		return sqlSession.insert(namespace + ".insertPost", dto);
	}

	@Override
	public int updatePost(CommunityDTO dto) {
		return sqlSession.update(namespace + ".updatePost", dto);
	}

	@Override
	public int deletePost(int pageNo) {
		return sqlSession.update(namespace + ".deletePost", pageNo);
	}
	
	@Override
	public int addHitToBoardPage(int pageNo) throws Exception {
		return sqlSession.update(namespace + ".addHitToBoardPage", pageNo);
	}

	@Override
	public List<FileUploadDTO> selectFileListByCb_id(int cb_id) throws Exception {
		return sqlSession.selectList(namespace + ".selectFileListByCb_id", cb_id);
	}

	@Override
	public int insertFile(FileUploadDTO dto) throws Exception {
		return sqlSession.insert(namespace + ".insertFile", dto);
	}

	@Override
	public int deleteFileByUrl(String url) throws Exception {
		return sqlSession.delete(namespace + ".deleteFileByUrl", url);
	}
}
