package com.spring.ex.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.spring.ex.dto.LostAnimalDTO;
import com.spring.ex.service.FileUploadService;
import com.spring.ex.service.LostAnimalService;
import com.spring.ex.service.PagingService;

@Controller
public class LostAnimalController {
	@Resource(name="uploadPath")
	String uploadPath;
	
	@Inject
	LostAnimalService lostAnimalService;
	
	PagingService pagingService;
	
	@Inject
	FileUploadService fileUploadService;

	// 실종 동물 게시판
	@RequestMapping("/communityLostBoard")
	public String lostCommunityBoard(Model model, HttpServletRequest request) throws Exception {
		// null 값으로 mybatis에 들어가면 문자열과 비교하게 되므로 오류남. 따라서 null이면 ""으로 변환
		String keyword = request.getParameter("keyword");
		keyword = keyword == null ? "" : keyword;
		
		// 게시물 총 개수를 가져오기 위한 조건 맵
		HashMap<String, Object> map = new HashMap<String, Object>();
		//postCountMap.put("keyword", keyword);
		
		pagingService = new PagingService(request, lostAnimalService.getTotalCountLostAnimalBoardList(map), 10);
		map.put("Page",  pagingService.getNowPage());
		map.put("PageSize", 12);
		List<LostAnimalDTO> sList = lostAnimalService.getLostAnimalBoardList(map);
		
		model.addAttribute("slist", sList);
		model.addAttribute("Paging", pagingService.getPaging());
		
		return "community/lostAnimalBoard";
	}
	
	
	//실종동물 게시글 상세페이지 출력
	@RequestMapping(value = "/readLostCommunityBoard" , method = RequestMethod.GET)
	public String readLostCommunityBoard(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception{
		int alb_id = Integer.parseInt(request.getParameter("alb_id"));
		Map<String, Object> sReadPage = lostAnimalService.getReadLostAnimal(alb_id);
		
		model.addAttribute("lcbReadPage", sReadPage);
		return "community/lostAnimalRead";
	}
	
	//실종동물 게시글 삭제
	@RequestMapping(value = "/deleteLostAnimalBoard", method = RequestMethod.GET)
	public String deleteLostAnimalBoard(HttpServletRequest request) throws Exception{
		int alb_id = Integer.parseInt(request.getParameter("alb_id"));
		lostAnimalService.deleteLostAnimalBoard(alb_id);
		return "redirect:communityLostBoard";
	}
	
	//실종동물 게시글 글작성 페이지
	@RequestMapping(value = "/writeLostAnimalBoard", method = RequestMethod.GET)
	public String communityBoardWrite() throws Exception{
		return "community/lostAnimalWrite";
	}
	
	//실종동물 게시글 수정
	@RequestMapping(value = "/modifyLostAnimalBoard", method = RequestMethod.POST)
	@ResponseBody
	public int modifyLostAnimalBoard(HttpServletRequest request, LostAnimalDTO dto, MultipartFile file) throws Exception {
		String fileName = null;
		if(!file.isEmpty()) {
			fileName = fileUploadService.uploadFile(file, "/images/uploaded_images");
			//System.out.println(fileName);
			dto.setImg_path(fileName);
		}
		int ajaxResult = lostAnimalService.modifyLostAnimalBoard(dto);
	
		if(ajaxResult != 1){
			return 0;
		}else {
			return 1;
		}
	}
	
	//실종동물 게시글 글작성
	@RequestMapping(value = "/dowriteLostAnimalBoard", method = RequestMethod.POST)
	@ResponseBody
	public int dowriteLostAnimalBoard(LostAnimalDTO dto, HttpServletRequest request, @RequestParam(value="file", required = false) MultipartFile file) throws Exception{
		String img_path = null;
		int res = 0;
		if(file != null) { 
			img_path = fileUploadService.uploadFile(file, "/images/uploaded_images");
		}
		
		LostAnimalDTO laDTO = new LostAnimalDTO();
		laDTO.setM_id(Integer.parseInt(request.getParameter("m_id")));
		laDTO.setImg_path(img_path);
		laDTO.setPet_name(request.getParameter("pet_name"));
		laDTO.setAge(request.getParameter("age"));
		laDTO.setSex_cd(request.getParameter("sex_cd"));
		laDTO.setKind_cd(request.getParameter("kind_cd"));
		laDTO.setColor_cd(request.getParameter("color_cd"));
		laDTO.setLost_date(request.getParameter("lost_date"));
		laDTO.setLost_place(request.getParameter("lost_place"));
		laDTO.setContent(request.getParameter("content"));
		//dto.setImg_path(img_path);
		
		res = lostAnimalService.writeLostAnimalBoard(laDTO);
		return res;
		/*
		if(res == 1) {
			return "redirect:/communityLostBoard"; 
		}else {
			return "redirect:/error"; 
		}
		*/
	}
}
