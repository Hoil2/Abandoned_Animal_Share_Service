package com.spring.ex.admin.controller;

import java.util.Arrays;
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
public class AdminLostAnimalController {
	@Resource(name="uploadPath")
	String uploadPath;
	
	@Inject
	LostAnimalService lostAnimalService;
	
	PagingService pagingService;
	
	@Inject
	FileUploadService fileUploadService;

	// 실종 동물 게시판
	@RequestMapping(value = "/admin/lostAnimalBoardAdmin" , method = RequestMethod.GET)
	public String lostAnimalBoardAdmin(Model model, HttpServletRequest request) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("checkBoard", "admin");
		
		String searchKeyword = request.getParameter("searchKeyword");
		String searchCategory = request.getParameter("searchCategory");
		
		if (searchKeyword == null && searchCategory == null) {
			model.addAttribute("searchCategory", "no");
			model.addAttribute("searchKeyword", "no");
			map.put("searchCategory", "noSearch");
		}else {
			model.addAttribute("searchCategory", searchCategory);
			model.addAttribute("searchKeyword", searchKeyword);
			map.put("searchCategory", searchCategory);
			map.put("searchKeyword", searchKeyword);
		}
		
		pagingService = new PagingService(request, lostAnimalService.getTotalCountLostAnimalBoardList(map), 10, "page");
		map.put("Page",  pagingService.getNowPage());
		map.put("PageSize", 10);
		
		List<LostAnimalDTO> sList = lostAnimalService.getLostAnimalBoardList(map);
		model.addAttribute("slist", sList);
		model.addAttribute("Paging", pagingService.getPaging());
		
		return "admin/animalcenter/lostAnimalBoardAdmin";
	}
	
	
	//실종동물 게시글 상세페이지 출력
	@RequestMapping(value = "/admin/lostAnimalView" , method = RequestMethod.GET)
	public String readLostCommunityBoardAdmin(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception{
		int alb_id = Integer.parseInt(request.getParameter("alb_id"));
		Map<String, Object> sReadPage = lostAnimalService.getReadLostAnimal(alb_id);
		
		model.addAttribute("lcbReadPage", sReadPage);
		return "admin/animalcenter/lostAnimalView";
	}
	
	//실종동물 게시글 삭제
	@RequestMapping(value = "/admin/lostAnimalSelectDelete", method = RequestMethod.GET)
	@ResponseBody
	public int lostAnimalSelectDelete(HttpServletRequest request) throws Exception {
		
		int[] ajaxMsg = Arrays.stream(request.getParameterValues("valueArr")).mapToInt(Integer::parseInt).toArray();
		int delResult = 0, ajaxResult = 0;
		int size = ajaxMsg.length;
		for(int i=0; i<size; i++) {
			delResult = lostAnimalService.deleteLostAnimalBoard(ajaxMsg[i]); //DB에서 삭제
			if(delResult == 1) {
				ajaxResult += 1;
			}else {
				System.out.println("실종동물 게시글 삭제 문제");
			}
		}
		if(size != ajaxResult){
			return 0;
		}else {
			return 1;
		}
	}
	
	//실종동물 게시글 작성페이지 출력
	@RequestMapping(value = "/admin/writeLostAnimalPage" , method = RequestMethod.GET)
	public String btnLostAnimal(HttpServletRequest request) throws Exception{
		return "admin/animalcenter/lostAnimalWrite";
	}
	
	//실종동물 게시글 수정페이지 출력
	@RequestMapping(value = "/admin/modifyLostAnimalBoardPage" , method = RequestMethod.GET)
	public String modifyLostAnimalBoardPage(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception{
		int alb_id = Integer.parseInt(request.getParameter("alb_id"));
		Map<String, Object> sReadPage = lostAnimalService.getReadLostAnimal(alb_id);
		
		model.addAttribute("lcbReadPage", sReadPage);
		return "admin/animalcenter/lostAnimalModfiyView";
	}
	
	//실종동물 게시여부 변경
	@RequestMapping(value = "/admin/modifyEnableLostAnimal", method = RequestMethod.GET)
	@ResponseBody
	public int modifyEnableLostAnimal(HttpServletRequest request) throws Exception {
		int alb_id = Integer.parseInt(request.getParameter("alb_id"));
		int enable = Integer.parseInt(request.getParameter("enable"));
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("alb_id", alb_id);
		map.put("enable", enable);
		int ajaxResult = lostAnimalService.modifyEnableLostAnimal(map);
	
		if(ajaxResult != 1){
			return 0;
		}else {
			return 1;
		}
	}
	
	
}
