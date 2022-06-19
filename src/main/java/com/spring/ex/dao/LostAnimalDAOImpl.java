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
	
	public int getTotalCountLostAnimalBoardList(HashMap<String, Object> map) throws Exception {
		return sqlSession.selectOne(namespace + ".getTotalCountLostAnimalBoardList", map);
	}
	public int writeLostAnimalBoard(LostAnimalDTO dto) throws Exception {
		return sqlSession.insert(namespace + ".writeLostAnimalBoard", dto);
	}
	public int deleteLostAnimalBoard(int alb_id) throws Exception {
		return sqlSession.delete(namespace + ".deleteLostAnimalBoard", alb_id);
	}
	public Map<String, Object> getReadLostAnimal(int alb_id) throws Exception {
		return sqlSession.selectOne(namespace + ".getReadLostAnimal", alb_id);
	}
}