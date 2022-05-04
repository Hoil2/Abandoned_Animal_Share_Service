package com.spring.ex.controller;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.ex.dto.CommunityDTO;
import com.spring.ex.dto.PagingDTO;
import com.spring.ex.service.CommunityService;
import com.spring.ex.service.PagingService;

@Controller
@RequestMapping("/community")
public class CommunityController {
	
	@Inject
	CommunityService service;
	
	PagingService pagingService;
	
	@RequestMapping("/daily")
	public String chats(Model model, HttpServletRequest request) {
		return "community/community_daily";
	}
	
	@RequestMapping("/info")
	public String questions(Model model, HttpServletRequest request) throws Exception {
		int totalCount = service.getCommunityInfoBoardPostTotalCount();
		int pageSize = 10;
		
		pagingService = new PagingService(request, totalCount, pageSize);
		
		List<CommunityDTO> communityList = service.getCommunityInfoBoardPage(pagingService.getMap());
		
		model.addAttribute("Paging", pagingService.getPaging());
		model.addAttribute("clist", communityList);
		
		return "community/community_info";
	}
}
