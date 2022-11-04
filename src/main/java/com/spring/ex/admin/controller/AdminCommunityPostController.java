package com.spring.ex.admin.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;
import com.spring.ex.dto.CommunityDTO;
import com.spring.ex.dto.MemberDTO;
import com.spring.ex.service.CommunityService;
import com.spring.ex.service.MemberService;
import com.spring.ex.service.PagingService;

@Controller
public class AdminCommunityPostController {
	
	@Inject
	private CommunityService communityService;
	
	@Inject
	private MemberService memberService;
	
	private PagingService pagingService;
	
	// 게시물 등록
	@ResponseBody
	@RequestMapping("/admin/community/savePost")
	public String savePost(HttpServletRequest request) {
		MemberDTO member = (MemberDTO)request.getSession().getAttribute("member");
		/*if(!member.getGrade().equals("Admin")) {
			System.err.println("게시물을 올릴 자격이 없습니다.");
			return "error";
		}*/
		
		String cb_id = request.getParameter("cb_id");
		String mp_id = request.getParameter("mp_id");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String classify = request.getParameter("classify");
		
		// 새로 게시물 생성
		if(cb_id == null) {
			CommunityDTO community = new CommunityDTO();
			community.setM_id(member.getM_id());
			community.setMp_id(Integer.parseInt(mp_id));
			community.setTitle(title);
			community.setContent(content);
			community.setClassify(Integer.parseInt(classify));
			communityService.insertPost(community);
		}
		// 기존 게시물 수정
		else {
			CommunityDTO community = communityService.getPageDetail(Integer.parseInt(cb_id)); 
			community.setMp_id(Integer.parseInt(mp_id));
			community.setTitle(title);
			community.setContent(title);
			community.setClassify(Integer.parseInt(classify));
			communityService.updatePost(community);
		}
		
		return "success";
	}
	
	@ResponseBody
	@RequestMapping("/admin/community/deletePosts")
	public String deletePosts(HttpServletRequest request) {
		MemberDTO member = (MemberDTO)request.getSession().getAttribute("member");
		/*if(!member.getGrade().equals("Admin")) {
			System.err.println("게시물을 올릴 자격이 없습니다.");
			return "error";
		}*/
		
		String[] cb_idList = request.getParameterValues("cb_idList");
		for(String cb_id : cb_idList) {
			communityService.deletePost(Integer.parseInt(cb_id));
			System.out.println("cb_id : " + cb_id + " 삭제 완료");
		}
		
		return "success";
	}
	
	@Resource(name="uploadPath")
	String localPath;
	
	// 서버+로컬에 이미지 저장
	@ResponseBody
	@RequestMapping(value="/adminUploadSummernoteImageFile", produces = "application/json; charset=utf8")
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request ) throws Exception {
		//int cb_id = Integer.parseInt(request.getParameter("cb_id"));
		JsonObject jsonObject = new JsonObject();
		// 내부경로로 저장
		String contextRoot = new HttpServletRequestWrapper(request).getRealPath("/");
		String fileRoot = contextRoot+"/resources/images/uploaded_images/";
		String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
		String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
		File serverFile = new File(fileRoot + savedFileName);
		File localFile = new File(localPath + "/images/uploaded_images/" + savedFileName);
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, serverFile);	// 서버에 파일 저장
			FileUtils.copyInputStreamToFile(fileStream, localFile);
			jsonObject.addProperty("url", "/resources/images/uploaded_images/"+savedFileName); // contextroot + resources + 저장할 내부 폴더명
			jsonObject.addProperty("responseCode", "success");
			
			System.out.println("insert localFile : " + localFile.getPath());
			
			// 데이터베이스에 게시판 id와 경로 저장
			//FileUploadDTO fileUploadDTO = new FileUploadDTO();
			//fileUploadDTO.setCb_id(cb_id);
			//fileUploadDTO.setUrl("/resources/images/uploaded_images/"+savedFileName);
			//communityService.insertFile(fileUploadDTO);
		} catch (IOException e) {
			FileUtils.deleteQuietly(serverFile);	//저장된 파일 삭제
			FileUtils.deleteQuietly(localFile);	//저장된 파일 삭제
			jsonObject.addProperty("responseCode", "error");
			//communityService.deleteFileByUrl("/resources/images/uploaded_images/"+savedFileName);
			e.printStackTrace();
		} 
		String a = jsonObject.toString();
		return a;
	}
}
