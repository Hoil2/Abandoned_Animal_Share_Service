package com.spring.ex.controller;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.ex.dto.PagingDTO;
import com.spring.ex.dto.ShareCenterDTO;
import com.spring.ex.service.ShareCenterService;

@Controller
public class ShareCenterController {
	@Inject
	ShareCenterService service;
	
	//분양센터페이지 유기동물 목록 출력
	@RequestMapping(value = "/shereCenterPage" , method = RequestMethod.GET)
	public String shereCenterPage(Model model, HttpServletRequest request) throws Exception{
		/*
		List<ShareCenterDTO> shareCenterList = service.getShareCenterBoardPage(pagingService.getMap());
		String searchTheme  = request.getParameter("searchTheme");
		String searchArea = request.getParameter("searchArea");
		String searchAlignment = request.getParameter("alignment");
		
		pagingService.PagingService(request, service.getShareCenterBoardViewTotalCount(), 12, searchTheme, searchArea, searchAlignment);
		//String alignment2 = request.getParameter("alignmen2");
		

		model.addAttribute("slist", shareCenterList);
		model.addAttribute("searchAlignment", searchAlignment);
		model.addAttribute("searchArea", searchArea);
		model.addAttribute("searchTheme", searchTheme);
		model.addAttribute("Paging", pagingService.getPaging());*/
		
		
		
		String searchTheme  = "allTheme";
		String searchArea = "allArea";
		//String searchTheme  = request.getParameter("searchTheme");
		//String searchArea = request.getParameter("searchArea");
		
		String searchAlignment = request.getParameter("alignment");
		
		
		if(StringUtils.isEmpty(searchAlignment)) {
			searchAlignment = "alignmentHit";
			System.out.println("asf");
		} 
		else if(!StringUtils.isEmpty(searchAlignment)){
			System.out.println("saf");
			System.out.println( searchAlignment);
			//scsDTO.setSearchAlignment(searchAlignment);
		}
		
		HashMap<String, String> searchMap = new HashMap<String, String>();
		searchMap.put("searchArea", searchArea);
		searchMap.put("searchTheme", searchTheme);
		searchMap.put("alignment", searchAlignment);
		
		//페이징
		int totalCount = service.getShareCenterBoardViewTotalCount(searchMap);
		int page = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));
		
		PagingDTO paging = new PagingDTO();
		paging.setPageNo(page);
		paging.setPageSize(12);
		paging.setTotalCount(totalCount);
		
		page = (page - 1) * 12;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("Page", page);
		map.put("PageSize", paging.getPageSize());
		map.put("searchArea", searchArea);
		map.put("searchTheme", searchTheme);
		map.put("alignment", searchAlignment);
		
		//검색 및 결과값 담기
		List<ShareCenterDTO> slist = service.getShareCenterBoardPage(map);
		
		model.addAttribute("slist", slist);
		model.addAttribute("Paging", paging);
		model.addAttribute("searchArea", searchArea);
		model.addAttribute("searchTheme", searchTheme);
		//model.addAttribute("searchAlignment", scsDTO.getSearchAlignment());
		model.addAttribute("alignment", searchAlignment);
		System.out.println("하단"+searchAlignment);
		//System.out.println(scsDTO.getSearchAlignment());
		
		
		return "shereCenter";
	}
	
	@RequestMapping(value = "/sTestPage",  method = RequestMethod.GET)
	public String shereCenterPageView2( ShareCenterDTO dto) throws Exception {
		service.getShareCenterTest(dto);
		
		return "shereCenterTest";
	}
	
	
	//Db연결 확인
	@RequestMapping("/sTest")
	public String DBConTest(HttpServletRequest request) throws Exception {
		HashMap<String, String> searchMap = new HashMap<String, String>();
		searchMap.put("searchArea", "allArea");
		searchMap.put("searchTheme", "allTheme");
		searchMap.put("searchKeyword", "alignmentDay");
		
		int res = service.getShareCenterBoardViewTotalCount(searchMap);
		
		System.out.println("res :" + res);
		return "shereCenter"; 
	}
	

}
