package com.spring.ex.service;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequestWrapper;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Service;

import com.spring.ex.dao.CommentDAO;
import com.spring.ex.dao.CommunityDAO;
import com.spring.ex.dao.CommunityLikeDAO;
import com.spring.ex.dto.CommentDTO;
import com.spring.ex.dto.CommunityDTO;
import com.spring.ex.dto.FileUploadDTO;

@Service
public class CommunityServiceImpl implements CommunityService {
	private final int dictBoard = 1;
	private final int dailyBoard = 2;
	private final int infoBoard = 3;
	
	@Resource(name="uploadPath")
	String uploadPath;
	
	@Inject
	private CommunityDAO communityDAO;
	
	@Inject
	private CommentDAO commentDAO;
	
	@Inject
	private CommunityLikeDAO communityLikeDAO;
	
	@Override
	public List<HashMap<String, Object>> getBoardPage(HashMap<String, Object> map) throws Exception {
		return communityDAO.getBoardPage(map);
	}

	// 정보 공유 게시판의 게시물 총 개수
	@Override
	public int getCommunityBoardPostTotalCount(HashMap<String, Object> map) throws Exception {
		return communityDAO.getCommunityBoardPostTotalCount(map);
	}
	
	// 게시물 추가
	@Override
	public int insertPost(CommunityDTO dto) throws Exception {
		return communityDAO.insertPost(dto);
	}
	
	//게시물 상세 페이지 가져오기
	@Override
	public CommunityDTO getPageDetail(int pageNo) throws Exception {
		return communityDAO.getPageDetail(pageNo);
	}
	
	// 게시물 수정
	@Override
	public int updatePost(CommunityDTO dto) throws Exception {
		return communityDAO.updatePost(dto);
	}

	// 게시물 삭제
	@Override
	public int deletePost(int pageNo) throws Exception {
		return communityDAO.deletePost(pageNo);
	}
	
	// 게시물에 조회수 1 추가
	@Override
	public int addHitToBoardPage(int pageNo) throws Exception {
		return communityDAO.addHitToBoardPage(pageNo);
	}
	
	// 댓글
	@Override
	public List<HashMap<String, Object>> selectCommentList(int pageNo) throws Exception {
		return commentDAO.selectCommentList(pageNo);
	}
	
	@Override
	public int insertComment(CommentDTO dto) throws Exception {
		return commentDAO.insertComment(dto);
	}

	@Override
	public int updateComment(CommentDTO dto) throws Exception {
		return commentDAO.updateComment(dto);
	}

	@Override
	public int deleteComment(int cbr_id) throws Exception {
		return commentDAO.deleteComment(cbr_id);
	}

	// 좋아요
	@Override
	public int getCommunityLikeCount(int cb_id) {
		return communityLikeDAO.getCommunityLikeCount(cb_id);
	}

	@Override
	public int insertCommunityLike(int cb_id, int m_id) {
		return communityLikeDAO.insertCommunityLike(cb_id, m_id);
	}

	@Override
	public int deleteCommunityLike(int cb_id, int m_id) {
		return communityLikeDAO.deleteCommunityLike(cb_id, m_id);
	}

	@Override
	public int existCommunityLike(int cb_id, int m_id) {
		return communityLikeDAO.existCommunityLike(cb_id, m_id);
	}

	@Override
	public String convertClassifyToUrl(int classify) {
		String url = "";
		switch(classify) {
			case dictBoard:
				url = "community/dictionary";
				break;
			case dailyBoard:
				url = "community/daily";
				break;
			case infoBoard:
				url = "community/info";
				break;
			default:
				url = "error";
				break;
		}
		return url;
	}

	@Override
	public List<FileUploadDTO> selectFileListByCb_id(int cb_id) throws Exception {
		return communityDAO.selectFileListByCb_id(cb_id);
	}
	
	@Override
	public List<String> selectUrlListByCb_id(int cb_id) throws Exception {
		List<FileUploadDTO> fileUploadDTOList = communityDAO.selectFileListByCb_id(cb_id);
		List<String> stringList = new ArrayList<String>();
		for(int i = 0; i < fileUploadDTOList.size(); i++) {
			stringList.add(fileUploadDTOList.get(i).getUrl());
		}
		return stringList;
	}

	@Override
	public int insertFile(FileUploadDTO dto) throws Exception {
		return communityDAO.insertFile(dto);
	}

	@Override
	public int deleteFileByUrl(String url) throws Exception {
		return communityDAO.deleteFileByUrl(url);
	}

	@Override
	public int deleteFileEveryWhere(String url, String contextRoot) throws Exception {
		try {
			File serverFile = new File(contextRoot + url);
			File localFile = new File(uploadPath + "/images/uploaded_images/" + serverFile.getName());
			serverFile.delete();
			localFile.delete();
			
			System.out.println("사용되지 않는 이미지 삭제");
			System.out.println("서버 삭제 : " + serverFile.getPath().toString());
			System.out.println("로컬 삭제 : " + localFile.getPath().toString());
			deleteFileByUrl(url); 					  // database
			return 1;
		}
		catch(Exception e)
		{
			e.printStackTrace();
			return -1;
		}
	}
	
	@Override
	public List<String> convertHtmlToSrcList(String html) throws Exception {
		List<String> srcList = new ArrayList<String>();
		Document doc = Jsoup.parseBodyFragment(html);
		Elements imgs = doc.getElementsByTag("img");
		for(int i = 0; i < imgs.size(); i++)
			srcList.add(imgs.get(i).attr("src"));
		return srcList;
	}

	@Override
	public void copySrcListToLocal(List<String> srcList, String contextRoot) throws Exception {
		for(int i = 0; i < srcList.size(); i++) {
			File file = new File(contextRoot + srcList.get(i));
			File newFile = new File(uploadPath + "/images/uploaded_images/" + file.getName());
			Files.copy(file.toPath(), newFile.toPath(), StandardCopyOption.REPLACE_EXISTING);
			System.out.println("로컬에 이미지 복사 : " + newFile.toPath().toString());
		}
	}

	@Override
	public void deleteFileNotInMain(List<String> main, List<String> target, String contextRoot) throws Exception {
		for(String url : target) {
			if(!main.contains(url)) {
				deleteFileEveryWhere(url, contextRoot);
			}
		}
	}
}
