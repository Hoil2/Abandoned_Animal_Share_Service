// 헷갈릴 까봐 임시로 분할함

package com.spring.ex.controller;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.ex.dto.PagingDTO;
import com.spring.ex.dto.ShareCenterDTO;
import com.spring.ex.dto.ShelterDTO;
import com.spring.ex.service.ShareCenterService;
import com.spring.ex.service.ShelterService;

@Controller
public class ShareCenterSearchRegionController {
	
	@Inject
	ShareCenterService service;
	
	@Inject
	private ShelterService shelterService;
	
	// 2022.08.20 추가 by 김홍일
	// 유기동물 지역 검색
	@RequestMapping(value = "/shareCenterPage_searchAniamlInRegion" , method = RequestMethod.GET)
	public String shareCenterPage_searchAniamlInRegion(Model model, HttpServletRequest request) throws Exception{
		/*
		pagingService.put("searchArea", "");
		map.put("searchTheme", "");
		map.put("alignment", "");
		List<ShareCenterDTO> shareCenterList = service.getShareCenterBoardPage(pagingService.getMap());
		
		pagingService.PagingService(request, service.getShareCenterBoardViewTotalCount(map), 12, searchTheme, searchArea, searchAlignment);
		
		model.addAttribute("slist", shareCenterList);
		model.addAttribute("Paging", pagingService.getPaging());*/
		HttpSession session = request.getSession();
		String searchTheme  = request.getParameter("searchTheme");
		String searchArea = request.getParameter("searchArea");
		//String searchTheme  = request.getParameter("searchTheme");
		//String searchArea = request.getParameter("searchArea");
		String searchAlignment = request.getParameter("alignment");
		
		if(StringUtils.isEmpty(searchTheme) || searchTheme == null) {
			searchTheme = "allTheme";
			session.setAttribute("searchTheme", "allTheme");
		} else if(!StringUtils.isEmpty(searchTheme)){
			session.setAttribute("searchTheme", searchTheme);
		}
		
		if(StringUtils.isEmpty(searchArea) || searchArea == null) {
			searchArea = "allArea";
			session.setAttribute("searchArea", "allArea");
		} else if(!StringUtils.isEmpty(searchArea)){
			session.setAttribute("searchArea", searchArea);
		}
		
		if(StringUtils.isEmpty(searchAlignment)) {
			searchAlignment = "alignmentDay";
			session.setAttribute("alignment", "alignmentDay");
		} else if(!StringUtils.isEmpty(searchAlignment)){
			session.setAttribute("alignment", searchAlignment);
		}
		
		HashMap<String, String> searchMap = new HashMap<String, String>();
		searchMap.put("searchArea", (String) session.getAttribute("searchArea"));
		searchMap.put("searchTheme", (String) session.getAttribute("searchTheme"));
		searchMap.put("alignment", (String) session.getAttribute("alignment"));
		
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
		map.put("searchArea", session.getAttribute("searchArea"));
		map.put("searchTheme", session.getAttribute("searchTheme"));
		map.put("alignment", session.getAttribute("alignment"));
		
		//검색 및 결과값 담기
		List<ShareCenterDTO> slist = service.getShareCenterBoardPage(map);
		
		model.addAttribute("slist", slist);
		model.addAttribute("Paging", paging);
		model.addAttribute("searchArea", searchArea);
		model.addAttribute("searchTheme", searchTheme);
		model.addAttribute("alignment", searchAlignment);
		System.out.println("검색 지역/테마/정렬 : " + searchArea + ", " + searchTheme + ", " + searchAlignment);
		
		List<String> seletedBoxList = service.getShareCenterAreaList();
		model.addAttribute("areaList", seletedBoxList);
		System.out.println(seletedBoxList);
		return "shareCenter_searchAnimalInRegion";
	}

	@ResponseBody
	@RequestMapping("/getAllShelterList")
	public List<ShelterDTO> getAllShelterList() {
		System.out.println(shelterService.selectAllShelterList());
		return shelterService.selectAllShelterList();
	}
}
