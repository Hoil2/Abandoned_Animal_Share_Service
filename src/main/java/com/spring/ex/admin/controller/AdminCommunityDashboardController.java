package com.spring.ex.admin.controller;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.ex.dto.CommentDTO;
import com.spring.ex.dto.CommunityDTO;
import com.spring.ex.dto.MemberDTO;
import com.spring.ex.service.CommunityService;
import com.spring.ex.service.MemberService;
import com.spring.ex.service.PagingService;

@Controller
public class AdminCommunityDashboardController {
	
	@Inject
	private CommunityService communityService;
	
	@Inject
	private MemberService memberService;
	
	private PagingService pagingService;
	
	//-------------------------------
	// 관리자 대시보드 페이지 
	//-------------------------------
	@RequestMapping("/admin/{classify}")
	public String dailyDashboardPage(HttpServletRequest request, Model model, @PathVariable("classify") String classify) throws Exception {
		
		// 커뮤니티 url 유효성 검사
		if(!isClassifyVaild(classify))
		{
			System.err.println("유효한 커뮤니티 url이 아닙니다.");
			return "error";
		}
		
		int board = 0;  
		if(classify.equals("dictionary")) board = 1;
		else if(classify.equals("daily")) board = 2;
		else if(classify.equals("info")) board = 3;
		
		String filter = request.getParameter("filter");
		String keyword = request.getParameter("keyword");
		filter = filter == null ? "" : filter;
		keyword = keyword == null ? "" : keyword;
		System.out.println("filter : " + filter + ", keyword : " + keyword);
		
		// 게시물 총 개수를 가져오기 위한 조건 맵
		HashMap<String, Object> postCountMap = new HashMap<String, Object>();
		postCountMap.put("classify", board);
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
		postMap.put("classify", board);
		postMap.put("filter", filter);
		postMap.put("keyword", keyword);
		
		// 게시물 가져오기
		List<HashMap<String, Object>> communityList = communityService.getBoardPage(postMap);
		
		model.addAttribute("dailyCommunityList", communityList);
		model.addAttribute("Paging", pagingService.getPaging());
		
		if(board == 1) return "admin/community/dictionary_dashboard";
		else if(board == 2) return "admin/community/daily_dashboard";
		else if(board == 3) return "admin/community/info_dashboard";
		else return "error";
	}
	
	//-------------------------------
	// 관리자 커뮤니티 상세 페이지
	//-------------------------------
	@RequestMapping("/admin/{classify}/{cb_id}")
	public String viewCommunity(HttpServletRequest request, Model model, @PathVariable("classify") String classify, @PathVariable("cb_id") int cb_id) throws Exception {
		
		// 커뮤니티 url 유효성 검사
		if(!isClassifyVaild(classify))
		{
			System.err.println("유효한 커뮤니티 url이 아닙니다.");
			return "error";
		}
		
		CommunityDTO community = communityService.getPageDetail(cb_id);
		MemberDTO writer = memberService.getMemberByM_id(community.getM_id());
		List<HashMap<String, Object>> commentList = communityService.selectCommentList(cb_id);
		
		model.addAttribute("community", community);
		model.addAttribute("writer", writer);
		model.addAttribute("clist", commentList);
		model.addAttribute("classify", classify);
		
		return "admin/community/community_view";
	}
	
	// 커뮤니티 url 유효성 검사
	public boolean isClassifyVaild(String classify) {
		String[] classifyList = {"dictionary", "daily", "info"};
		boolean isClassifyVaild = false; 
		for(String c : classifyList) {
			if(classify.contains(c)) {
				isClassifyVaild = true;
			}
		}
		if(isClassifyVaild == false) {
			System.err.println("유효한 커뮤니티 url이 아닙니다.");
			return false;
		}
		return true;
	}
}