package com.spring.ex.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.ex.admin.service.AdminCommunityService;
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
	private AdminCommunityService adminCommunityService;
	
	@Inject
	private MemberService memberService;
	
	private PagingService pagingService;
	
	//-------------------------------
	// 관리자 대시보드 페이지 
	//-------------------------------
	
	// 지식백과 대시보드 페이지
	@RequestMapping("/admin/community/dictionary")
	public String dictionaryDashboardPage(HttpServletRequest request, Model model) throws Exception {
		return communityDashboardPage(request, model, "dictionary");
	}
	
	// 일상 대시보드 페이지
	@RequestMapping("/admin/community/daily")
	public String dailyDashboardPage(HttpServletRequest request, Model model) throws Exception {
		return communityDashboardPage(request, model, "daily");
	}
	
	// 정보공유 대시보드 페이지
	@RequestMapping("/admin/community/info")
	public String infoDashboardPage(HttpServletRequest request, Model model) throws Exception {
		return communityDashboardPage(request, model, "info");
	}
	
	public String communityDashboardPage(HttpServletRequest request, Model model, String classify) throws Exception {
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
		String search = request.getParameter("search");
		System.out.println("filter : " + filter + ", search : " + search);
		
		// 게시물 개수 가져오기
		int totalCount = adminCommunityService.getAdminBoardPageCount(search, filter, board);
		System.out.println("게시물 개수 : " + totalCount);
		
		// 게시물 개수를 바탕으로 페이지 설정
		final int pageSize = 10;  
		pagingService = new PagingService(request, totalCount, pageSize);
		
		// 게시물 가져오기
		List<Map<String, Object>> communityList = adminCommunityService.getAdminBoardPage(search, filter, board, pagingService.getNowPage(), pageSize);
		List<Map<String, Object>> postCountBy7Day = adminCommunityService.getPostCountBy7Day(board);
		System.out.println(postCountBy7Day);
		
		
		model.addAttribute("communityList", communityList);
		model.addAttribute("Paging", pagingService.getPaging());
		model.addAttribute("classify", classify);
		model.addAttribute("board", board);
		model.addAttribute("filter", filter);
		model.addAttribute("search", search);
		
		model.addAttribute("postCountOfToday", adminCommunityService.getPostCountOfToday(board));
		model.addAttribute("postCountBy7Day", postCountBy7Day);
		
		return "admin/community/community_dashboard";
	}
	
	//-------------------------------
	// 관리자 커뮤니티 상세 페이지
	//-------------------------------
	@RequestMapping("/admin/community/{classify}/{cb_id}")
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
