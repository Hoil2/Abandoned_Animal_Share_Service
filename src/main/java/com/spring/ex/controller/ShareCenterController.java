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
		if(alignment == "alignmentHit") {
			alignment = "alignmentHit";
			//model.addAttribute("alignment", "alignmentHit");
		} else if(alignment == "alignmentGood") {
			alignment = "alignmentGood";
			//model.addAttribute("alignment", "alignmentGood");
		} else {
			alignment = "alignmentDay";
			//model.addAttribute("alignment", "alignmentDay");
		}*/
		
		/*
		
		List<ShareCenterDTO> shareCenterList = service.getShareCenterBoardPage(pagingService.getMap());
		String searchTheme  = request.getParameter("searchTheme");
		String searchArea = request.getParameter("searchArea");
		String searchAlignment = request.getParameter("alignment");
		
		pagingService.PagingService(request, service.getShareCenterBoardViewTotalCount(), 12, searchTheme, searchArea, searchAlignment);
		//String alignment2 = request.getParameter("alignmen2");
		

		//System.out.println(alignment);
		//System.out.println(alignment2);
		model.addAttribute("slist", shareCenterList);
		model.addAttribute("searchAlignment", searchAlignment);
		model.addAttribute("searchArea", searchArea);
		model.addAttribute("searchTheme", searchTheme);
		
		
		
		model.addAttribute("Paging", pagingService.getPaging());*/
		
		
		
		//ShareCenterSearchDTO scsDTO = new ShareCenterSearchDTO();
		String searchTheme  = request.getParameter("searchTheme");
		String searchArea = request.getParameter("searchArea");
		String searchAlignment = request.getParameter("alignment");
		
		String searchAlignmentTest =  (String) request.getAttribute("alignment");
		/*if(searchAlignment != "alignmentDay" && searchAlignment != "alignmentHit" && searchAlignment != "alignmentGood") {
			scsDTO.setSearchAlignment("alignmentDay");
		}*/
		
		if(StringUtils.isEmpty(searchAlignment)) {
			//request.setAttribute("alignment", "alignmentDay" );
			searchAlignment = "alignmentDay";
			System.out.println("asf");
		} 
		else if(!StringUtils.isEmpty(searchAlignment)){
			System.out.println("saf");
			//request.getAttribute("alignment");
			System.out.println( searchAlignment);
			//System.out.println(request.getAttribute("alignment"));
			//scsDTO.setSearchAlignment(searchAlignment);
		}
		
		//System.out.println( request.getAttributeNames());
		//System.out.println(searchAlignment);
		//System.out.println(searchAlignment);
		
			
		HashMap<String, String> searchMap = new HashMap<String, String>();
		searchMap.put("searchArea", searchArea);
		searchMap.put("searchTheme", searchTheme);
		searchMap.put("searchKeyword", searchAlignment);
		
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
		map.put("searchAlignment", searchAlignment);
		
		//검색 및 결과값 담기
		List<ShareCenterDTO> slist = service.getShareCenterBoardPage(map);
		
		model.addAttribute("slist", slist);
		model.addAttribute("Paging", paging);
		model.addAttribute("searchArea", searchArea);
		model.addAttribute("searchTheme", searchTheme);
		//model.addAttribute("searchAlignment", scsDTO.getSearchAlignment());
		model.addAttribute("searchAlignment", searchAlignment);
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
