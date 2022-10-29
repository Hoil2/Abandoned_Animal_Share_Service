package com.spring.ex.admin.controller;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.ex.service.CommunityService;
import com.spring.ex.service.PagingService;

@Controller
public class AdminCommunityDashboardController {
	private final int dictBoard = 1;
	private final int dailyBoard = 2;
	private final int infoBoard = 3;
	
	@Inject
	private CommunityService communityService;
	
	private PagingService pagingService;
	
	@RequestMapping("/admin/dictionary")
	public String dictionaryDashboardPage() {
		
		return "admin/community/dictionary_dashboard";
	}
	
	@RequestMapping("/admin/daily")
	public String dailyDashboardPage(HttpServletRequest request, Model model) throws Exception {
		String filter = request.getParameter("filter");
		String keyword = request.getParameter("keyword");
		filter = filter == null ? "" : filter;
		keyword = keyword == null ? "" : keyword;
		System.out.println("filter : " + filter + ", keyword : " + keyword);
		
		// 게시물 총 개수를 가져오기 위한 조건 맵
		HashMap<String, Object> postCountMap = new HashMap<String, Object>();
		postCountMap.put("classify", dailyBoard);
		postCountMap.put("filter", filter);
		postCountMap.put("keyword", keyword);
		

		// 게시물 개수 가져오기
		int totalCount = communityService.getCommunityBoardPostTotalCount(postCountMap);
		System.out.println("게시물 개수 : " + totalCount);
		
		// 게시물 개수를 바탕으로 페이지 설정
		int pageSize = 10;  
		pagingService = new PagingService(request, totalCount, pageSize);
		
		// 게시물 가져오기 위한 조건 맵
		HashMap<String, Object> postMap = new HashMap<String, Object>();
		postMap.put("Page", pagingService.getNowPage());
		postMap.put("PageSize", pageSize);
		postMap.put("classify", dailyBoard);
		postMap.put("filter", filter);
		postMap.put("keyword", keyword);
		
		// 게시물 가져오기
		List<HashMap<String, Object>> communityList = communityService.getBoardPage(postMap);
		
		model.addAttribute("dailyCommunityList", communityList);
		model.addAttribute("Paging", pagingService.getPaging());
		
		return "admin/community/daily_dashboard";
	}
	
	@RequestMapping("/admin/info")
	public String infoDashboardPage() {
		
		return "admin/community/info_dashboard";
	}
	
	
	
	
}
