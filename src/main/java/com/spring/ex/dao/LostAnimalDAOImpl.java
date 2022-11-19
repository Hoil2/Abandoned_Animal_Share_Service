package com.spring.ex.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.ex.dto.LostAnimalDTO;
import com.spring.ex.dto.ShareCenterDTO;

@Repository
public class LostAnimalDAOImpl implements LostAnimalDAO{
	
	@Inject
	private SqlSession sqlSession;
	private static final String namespace = "com.spring.ex.LostAnimalMapper";
	
	@Override
	public List<LostAnimalDTO> getLostAnimalBoardList(HashMap<String, Object> map) throws Exception {
		return sqlSession.selectList(namespace + ".getLostAnimalBoardList", map);
	}
	@Override
	public int getTotalCountLostAnimalBoardList(HashMap<String, Object> map) throws Exception {
		return sqlSession.selectOne(namespace + ".getTotalCountLostAnimalBoardList", map);
	}
	@Override
	public int writeLostAnimalBoard(LostAnimalDTO dto) throws Exception {
		return sqlSession.insert(namespace + ".writeLostAnimalBoard", dto);
	}
	@Override
	public int deleteLostAnimalBoard(int alb_id) throws Exception {
		return sqlSession.delete(namespace + ".deleteLostAnimalBoard", alb_id);
	}
	@Override
	public Map<String, Object> getReadLostAnimal(int alb_id) throws Exception {
		return sqlSession.selectOne(namespace + ".getReadLostAnimal", alb_id);
	}

	@Override
	public List<String> getKindListWithDistinct() {
		return sqlSession.selectList(namespace + ".getKindListWithDistinct");
	}
	
	//실종 동물 게시판 게시여부 변경
	@Override
	public int modifyEnableLostAnimal(HashMap<String, Object> map) throws Exception {
		return sqlSession.update(namespace + ".modifyEnableLostAnimal", map);
	}
	//실동 게시글 수정
	@Override
	public int modifyLostAnimalBoard(LostAnimalDTO dto) throws Exception {
		return sqlSession.update(namespace + ".modifyLostAnimalBoard", dto);
	}
}